data {
  int<lower=0> N;
  vector[N] x;
  int<lower=0> y[N];
  real mu_a;
  real sig_a;
  real mu_t;
  real sig_t;
}

parameters {
  real alpha;
  real theta;
}

model {
  alpha ~ normal(mu_a, sig_a);
  theta ~ normal(mu_t, sig_t);

  for (n in 1:N) {
    y[n] ~ poisson(exp(alpha + theta * x[n]));
  }
}

generated quantities {
  int<lower=0> y_pred[N];
  for (n in 1:N){
    y_pred[n] = poisson_rng(exp(alpha + theta * x[n]));
  }
}