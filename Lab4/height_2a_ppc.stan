data {
    int<lower=0> N;
    real<lower=0> weight[N];
}

generated quantities{
    real<lower=0> a = normal_rng(167, 13);
    real<lower=0> b = normal_rng(8, 3);
    real<lower=0> height[N];

    for (n in 1:N)
        height[n] = normal_rng(a + b * weight[n], 13);
}
