generated quantities {
    int number_of_trials = 50;
    int<lower=0, upper=50> y;
    real<lower=0, upper=1> p = normal_rng(0.20, 0.03);

    y = binomial_rng(number_of_trials, p);
}