data{
    int <lower=0> N;
    vector[N] x;
    real mu_a;
    real sig_a;
    real mu_t;
    real sig_t;
}

generated quantities {
    real alpha = normal_rng(mu_a, sig_a);
    real theta = normal_rng(mu_t, sig_t);

    vector[N] y;
    for (j in 1:N){
        y[j] = poisson_rng(exp(alpha + theta * x[j]));
    }
}