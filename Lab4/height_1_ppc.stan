generated quantities {
    real<lower=0> mu = normal_rng(167, 13);
    real<lower=0> sigma = normal_rng(11, 3);

    real<lower=0> height = normal_rng(mu, sigma); 
}