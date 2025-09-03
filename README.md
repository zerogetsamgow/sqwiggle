
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Sqwiggle

## Introduction

<!-- badges: start -->

<!-- badges: end -->

Sqwiggle is a simple
[ELO](https://cran.r-project.org/web/packages/fitzRoy/vignettes/elo-ratings-example.html)
model for predicting [AFLW](https://www.afl.com.au/aflw) results built
in R using the
[fitzRoy](https://cran.r-project.org/web/packages/fitzRoy/index.html)
and [elo](https://cran.r-project.org/web/packages/elo/index.html)
packages. The name is derived from [Squiggle](https://squiggle.com.au/)

## A better ladder

A key motivation for Sqwiggle was to better understand the state of play
in the AFLW, which is an uneven competition with a compromised fixture.

- As the eighteen teams in the AFLW only play 12 games, whether a team
  is drawn against stronger or weaker opponents will be critical in
  determining the final ladder.

- Similarly, whether the current ladder is reflective of the likely
  finishing positions will depend on whether a team’s draw to date has
  been stronger/weaker than its overall fixture.

We can see this reflected in the table below, which shows data from the
current ladder and a predicted end-of-season ladder based on Sqwiggle.
While both ladders have North Melbourne sitting on top undefeated, other
teams shift position. For example, Geelong, who sit 16th and are
winless, are predicted by Sqwiggle to win six of their remaining nine
games and finish 9th. There current position reflects their opening
three games including matches against North Melbourne and Adelaide (two
of the top three teams based on the current Sqwiggle model) and Sydney
(this year’s biggest improver).

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

Team club_name
</th>

<th style="text-align:right;">

Wins current
</th>

<th style="text-align:right;">

Wins predicted
</th>

<th style="text-align:right;">

Position current
</th>

<th style="text-align:right;">

Position predicted
</th>

<th style="text-align:right;">

Position model
</th>

<th style="text-align:right;">

Position change
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 255) !important;">

North Melbourne
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

0
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 255) !important;">

Melbourne
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

0
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 255) !important;">

Hawthorn
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

2
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 255) !important;">

Sydney Swans
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

-1
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 255) !important;">

Adelaide Crows
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

1
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 255) !important;">

Brisbane Lions
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

3
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 255) !important;">

Carlton
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

0
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 255) !important;">

Essendon
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 255) !important;">

-4
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

Geelong Cats
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

7
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

West Coast Eagles
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

-2
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

Port Adelaide
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

-1
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

Western Bulldogs
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

0
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

St Kilda
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

0
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

Richmond
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

1
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

Collingwood
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

-4
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

Fremantle
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

-2
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

GWS GIANTS
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

0
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 255) !important;">

Gold Coast SUNS
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 255) !important;">

0
</td>

</tr>

</tbody>

</table>

## Team strength

As an ELO model, Sqwiggle’s assessment of teams and predictive ability
is based on past performance. Sqwiggle learns as each round is played.

    #> Warning: Removed 5 rows containing missing values or values outside the scale range
    #> (`geom_textline()`).

![](README_files/figure-gfm/sqwiggle_wiggle-1.png)<!-- -->

# How well does Sqwiggle go at tipping

Sqwiggle’s tipping performance for 2025 is summarised below.

| Number | Correct | Games | Cumulative |
|-------:|--------:|------:|-----------:|
|      1 |       4 |     9 |          4 |
|      2 |       8 |     9 |         12 |
|      3 |       7 |     9 |         19 |

| round_round_number | home_team_club_name | away_team_club_name | prediction | margin_predicted | tip |
|---:|:---|:---|---:|---:|:---|
| 4 | Melbourne | Richmond | 0.5927031 | 9 | Melbourne |
| 4 | Gold Coast SUNS | GWS GIANTS | 0.4675620 | -3 | GWS GIANTS |
| 4 | Carlton | Western Bulldogs | 0.5157316 | 2 | Carlton |
| 4 | Hawthorn | St Kilda | 0.5759018 | 8 | Hawthorn |
| 4 | Sydney Swans | Fremantle | 0.5736789 | 7 | Sydney Swans |
| 4 | Adelaide Crows | Brisbane Lions | 0.4963707 | 0 | Brisbane Lions |
| 4 | North Melbourne | Collingwood | 0.7367787 | 24 | North Melbourne |
| 4 | Essendon | Geelong Cats | 0.5209352 | 2 | Essendon |
| 4 | West Coast Eagles | Port Adelaide | 0.4638537 | -4 | Port Adelaide |
