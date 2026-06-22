# Calibration Lineage and Error Metrics

This repository documents the computational lineage for the corrected inverse-Gaussian shape-parameter calibration used in the associated manuscript.

## Legacy calibration

The original manuscript calibration used the legacy monolithic implementation. It reported coefficients:

```text
a = 0.2404
b = 0.4087
c = 0.01121
R^2 = 0.9523
```

That implementation used per-replication seed offsets.

## Corrected-RNG validation

The later modular implementation uses independent random-number streams based on NumPy `SeedSequence`. On the same 42-point calibration design, the corrected-RNG fit gives close coefficients:

```text
a = 0.2477
b = 0.3929
c = 0.01113
```

The conclusion is unchanged: the corrected effective-variance model substantially reduces inverse-Gaussian shape-parameter error in the near-critical calibration domain.

## Error denominators

Two relative-error denominators appear in the audit outputs:

1. **Fitted-normalized error**

```text
|eta_prediction - eta_fitted| / eta_fitted
```

On the corrected-RNG dataset this gives approximately:

```text
36.0% -> 5.1%
```

2. **Prediction-normalized error**

```text
|eta_prediction - eta_fitted| / eta_prediction
```

On the same corrected-RNG dataset this gives approximately:

```text
64.4% -> 5.1%
```

This second convention is the scale used for the manuscript headline statement. It measures distortion relative to the model-predicted shape scale.

## Interpretation

The legacy and corrected-RNG implementations differ slightly in fitted coefficients, but both support the same qualitative and quantitative conclusion: applying the beta correction reduces shape-parameter error by roughly an order of magnitude.

## Scope note

Network, digital-twin, and later industrial-extension experiments belong to separate extensions of the research program and are not used to support the present manuscript.
