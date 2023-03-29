data {
   int<lower=1> number_of_trials;
   int<lower=0, upper=number_of_trials> y;
}

parameters {
   real<lower=0, upper=1> p;
}

model {
    p ~ normal((number_of_trials-y) * 1.0 /number_of_trials, 0.03);
    y ~ binomial(number_of_trials, p);
}

generated quantities {
   int<lower=0, upper=number_of_trials> y_pred;
   y_pred = binomial_rng(number_of_trials, p);
}