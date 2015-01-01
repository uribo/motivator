# motivator: Keep and improve working motivation.

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
data(activity) %>%
  head()
```

Try, below command in some R files exist directory.

```{r}
gen_report() %>%
  head()
```

* `Point`...  Count `R` files (e.g. `.R`, `Rmd`, Image fie, `.pdf` etc.).
* `Class`... Relative point contribution value, 1 to 5.

### Plot Acitivity

```{r}
gen_report() %>%
  indicate_activity()
```

![](https://github.com/uribo/motivator/raw/master/inst/assets/img/demo_activity_log.png)


### Plot Year Activity (like a GitHub Contributions calendar)

[GitHub Contributions calendar](https://help.github.com/articles/viewing-contributions-on-your-profile-page/#viewing-contributions-from-specific-times)

```{r}
data(activity) %>%
  indicate_yr_activity()
```

![](https://github.com/uribo/motivator/raw/master/inst/assets/img/demo_year_activity_log.png)


or

```{r}
gen_year_report() %>%
  indicate_yr_activity()
```

## Workload


