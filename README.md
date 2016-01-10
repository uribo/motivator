# motivator: Keep and improve working motivation.

[![Project Status: Wip - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/0.1.0/wip.svg)](http://www.repostatus.org/#wip)
[![Travis-CI Build Status](https://travis-ci.org/uribo/motivator.svg?branch=master)](https://travis-ci.org/uribo/motivator)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/SUmisc)](http://cran.r-project.org/package=SUmisc)

## Description

Visualize your R working activity log.

Enjoy, your R work :)

## Installation

To install the development version use the `devtools` package:

```{r}
# install.packages("devtools")
devtools:install_github("uribo/motivator")
```

## Demo

### Setup

```{r}
library(motivator)
activity %>% head()
```

Try, below command in some R files exist directory.

```{r}
gen_report() %>% head()
```

* `point`...  Count `R` files (e.g. `.R`, `Rmd`, Image fie, `.pdf` etc.).
* `class`... Relative point contribution value, 1 to 5.

### Plot Acitivity

![](https://github.com/uribo/motivator/raw/master/inst/assets/img/demo_activity_log.png)

### Plot Year Activity (like a GitHub Contributions calendar)

[GitHub Contributions calendar](https://help.github.com/articles/viewing-contributions-on-your-profile-page/#viewing-contributions-from-specific-times)

### Visualize GitHub Contribution

```{r}
indicate_gh_contribution(username = "uribo") # change to your username
```

![](https://github.com/uribo/motivator/raw/master/man/figures/indicate-gh-contribution.png)

### SHINCHOKU DOUDESUKA

What about progress?

```{r}
# If exsit .git directory.
shinchoku_test(goal = 10)
```
