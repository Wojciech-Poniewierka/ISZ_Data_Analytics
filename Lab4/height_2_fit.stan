data {
    int<lower=0> N;
    real<lower=0> weight[N];
}

parameters {
    real b;
    real a;
    real sig;
    real mu;
}

transformed parameters {
    real v_mu[N];
    for (n in 1:N){
        v_mu[n] = a + b* weight[n]; 
    }
}

model {
    mu ~ normal(167, 13);
    sig ~ normal(11, 3);
    a ~ normal(167, 13);
    b ~ normal(0, 1);
}

generated quantities {
    real height_pred;
    for (n in 1:N){
        height_pred = normal_rng(v_mu[n], sig);
    }
}