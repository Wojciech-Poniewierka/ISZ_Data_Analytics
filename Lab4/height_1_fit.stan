data {
    int<lower=0> N;
    real<lower=0> heights[N];
}

parameters {
    real<lower=0> mu;
    real<lower=0> sigma;
}

model {
    mu ~ normal(167, 13);
    sigma ~ normal(8, 3);
    heights ~ normal(mu, sigma);
}

generated quantities {
    real<lower=0> height_pred = normal_rng(mu, sigma);
}