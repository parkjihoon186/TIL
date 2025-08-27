# my_profile.py

import pandas as pd
from IPython.display import display  # 추가

def get_data_profile(df: pd.DataFrame):
    """종합적인 데이터 프로파일링 함수"""

    print('=' * 50)
    print('종합 데이터 품질 리포트')
    print('=' * 50)

    # 1. 기본 통계
    print(f'\n1. 기본정보')
    print(f'- 데이터 크기: {df.shape[0]}행 x {df.shape[1]}열')
    print(f'- 메모리 사용량: {df.memory_usage(deep=True).sum() / 1024**2:.2f} MB')
    print(f'- 수치형 변수: {len(df.select_dtypes(include=["number"]).columns)}개')
    print(f'- 범주형 변수: {len(df.select_dtypes(include=["object"]).columns)}개')

    # 2. 결측값 분석
    print(f'\n2. 결측값 분석')
    missing_info = df.isnull().sum()
    m_pct = (missing_info / len(df)) * 100
    if missing_info.sum() == 0:
        print('✅ 결측값 없음. 완전')
    else:
        print('⚠️ 결측값 존재')
        missing_sum = pd.DataFrame({
            '결측수': missing_info,
            '결측율(%)': m_pct,
        }).round(2)
        missing_sum = missing_sum[missing_sum['결측수'] > 0]
        display(missing_sum)

    # 3. 데이터 타입별 분석
    print(f'\n3. 수치형 변수 품질 분석')
    num_cols = df.select_dtypes(include=['number']).columns

    quality_report = []
    for col in num_cols:
        col_data = df[col].dropna()
        stats = {
            '변수명': col,
            '평균': col_data.mean(),
            '표준편차': col_data.std(),
            '최솟값': col_data.min(),
            '최댓값': col_data.max(),
            '왜도': col_data.skew(),
            '첨도': col_data.kurtosis(),
        }

        Q1 = col_data.quantile(0.25)
        Q3 = col_data.quantile(0.75)
        IQR = Q3 - Q1
        mask = (col_data < Q1 - 1.5 * IQR) | (col_data > Q3 + 1.5 * IQR)
        outliers = col_data[mask]
        stats['이상값비율(%)'] = (len(outliers) / len(col_data)) * 100

        stats['유일값비율(%)'] = (col_data.nunique() / len(col_data)) * 100

        quality_report.append(stats)

    quality_df = pd.DataFrame(quality_report).round(3)
    display(quality_df)

    # 4. 분포 이상 감지
    print(f'\n4. 분포 이상 감지')
    print(f'\n- 극심한 왜도 (|skewness| > 2)')
    high_skews = quality_df[abs(quality_df['왜도']) > 2]['변수명'].tolist()

    if high_skews:
        print('⚠️ 극심한 왜도 발견')
        for var in high_skews:
            skew_val = quality_df.loc[quality_df['변수명'] == var, '왜도'].values[0]
            print(f'-- {var}: 왜도 = {skew_val:.3f}')
    else:
        print('-- ✅ 정상 범위 내 분포')

    print('\n- 높은 이상값 비율(> 5%)')
    high_outliers = quality_df[quality_df['이상값비율(%)'] > 5]['변수명'].tolist()
    if high_outliers:
        print('⚠️ 이상값 다수 존재')
        for var in high_outliers:
            outlier_pct = quality_df.loc[quality_df['변수명'] == var, '이상값비율(%)'].values[0]
            print(f'-- {var}: 이상값 {outlier_pct:.1f}%')
    else:
        print('-- ✅ 이상값 비율 양호')

    return quality_df

