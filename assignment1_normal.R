# 통계학입문 과제 1 — 정규분포 (R 버전)
# 이름: 박혜미  학번: 2026123139
# 목표: 정규분포의 표준화, 확률, 분위수, 확률밀도 그래프를 계산함
# 추가 패키지 설치 필요 없음 (R 기본 함수만 사용)

# [상황] 시험 점수 X는 평균 70점, 표준편차 10점의 정규분포를 따름
# X ~ N(70, 10^2)

# 문제 1. 평균(mu)과 표준편차(sigma)를 변수에 저장할 것
mu    <- 70
sigma <- 10

# 문제 2. 85점의 Z-score를 계산할 것
# Z = (관측값 - 평균) / 표준편차
score   <- 85
z_score <- (score - mu) / sigma

# 문제 3. 80점 이상 받을 확률 P(X >= 80)
# pnorm(x, mean, sd)            -> P(X <= x)   (Python의 stats.norm.cdf)
# pnorm(x, mean, sd, lower.tail = FALSE) -> P(X > x)  (Python의 stats.norm.sf)
p_above_80 <- pnorm(80, mean = mu, sd = sigma, lower.tail = FALSE)

# 문제 4. P(60 <= X <= 80) = P(X <= 80) - P(X <= 60)
p_60_to_80 <- pnorm(80, mean = mu, sd = sigma) - pnorm(60, mean = mu, sd = sigma)

# 문제 5. 상위 5% 기준점 = 95백분위수
# qnorm(확률, mean, sd) -> 분위수  (Python의 stats.norm.ppf)
cutoff_top_5 <- qnorm(0.95, mean = mu, sd = sigma)

# 결과 출력
cat("2. Z-score:", z_score, "\n")
cat("3. P(X >= 80):", p_above_80, "\n")
cat("4. P(60 <= X <= 80):", p_60_to_80, "\n")
cat("5. 상위 5% 기준점:", cutoff_top_5, "\n")

# 문제 6. 정규분포 확률밀도함수 그래프
# seq(40, 100, length.out = 400) -> Python의 np.linspace(40, 100, 400)
# dnorm(x, mean, sd)             -> Python의 stats.norm.pdf
# 주의: 확률밀도(세로축)는 특정 점에서의 확률 그 자체가 아님
x <- seq(40, 100, length.out = 400)
y <- dnorm(x, mean = mu, sd = sigma)

plot(x, y, type = "l", lwd = 2,
     main = "Exam scores: Normal distribution",
     xlab = "Score", ylab = "Density")
abline(v = mu, lty = 2)                      # 평균선 (점선)
grid()
legend("topright",
       legend = c("Normal density", "Mean = 70"),
       lty = c(1, 2), lwd = c(2, 1))

# [서술] 위 결과가 뜻하는 바를 2~3문장으로 작성할 것
# 답: 85점의 Z-score는 1.5로, 평균보다 표준편차 1.5개만큼 높은 점수이다.
# 80점 이상을 받을 확률은 약 15.9%이고, 평균 ± 1 표준편차 구간인 60~80점 사이에
# 학생의 약 68.3%가 분포한다. 또한 상위 5% 안에 들려면 약 86.45점 이상을 받아야 한다.

