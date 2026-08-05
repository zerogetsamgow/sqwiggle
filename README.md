
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Sqwiggle

## Introduction

<!-- badges: start -->

<!-- badges: end -->

Sqwiggle is a simple
[ELO](https://cran.r-project.org/web/packages/fitzRoy/vignettes/elo-ratings-example.html)
model for predicting [AFLW](https://www.afl.com.au/aflw) and
[AFLM](https://www.afl.com.au)results built in R using the
[fitzRoy](https://cran.r-project.org/web/packages/fitzRoy/index.html)
and [elo](https://cran.r-project.org/web/packages/elo/index.html)
packages. The name is derived from [Squiggle](https://squiggle.com.au/).

## A better ladder

A key motivation for Sqwiggle was to better understand the state of play
in the AFLW, which is an uneven competition with a compromised fixture.

Sqwiggle’s tipping performance for AFLW 2025 was admirable. Sqwiggle
would have won [The Age’s expert tips
competition](https://www.theage.com.au/sport/afl/aflw-expert-tips-20250814-p5mn1s.html)
and finished top ten in [ESPN’s footy tips
competition](https://www.footytips.com.au/competitions/aflw/ladders?view=ladderScores&season=747&competitionId=706852).

## AFLW

The predicted AFLW ladder after round 0 is below.

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

Team name
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

<th style="text-align:right;">

Opponents to date
</th>

<th style="text-align:right;">

Opposition strength
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

North Melbourne
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Melbourne
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Brisbane Lions
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Adelaide Crows
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Carlton
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Geelong Cats
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Western Bulldogs
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Port Adelaide
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Fremantle
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-3
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Collingwood
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-6
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Sydney Swans
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

West Coast Eagles
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Richmond
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

St Kilda
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Hawthorn
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Essendon
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

GWS GIANTS
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(243, 229, 0, 1) !important;">

Gold Coast SUNS
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

-10
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

NA
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

NA
</td>

</tr>

</tbody>

</table>

Sqwiggle’s tips for the next round of the AFLW are below.

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:right;">

Round
</th>

<th style="text-align:left;">

Home team
</th>

<th style="text-align:left;">

Away team
</th>

<th style="text-align:right;">

Prediction
</th>

<th style="text-align:right;">

Home game advantage
</th>

<th style="text-align:right;">

Margin predicted
</th>

<th style="text-align:left;">

Tip
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

St Kilda
</td>

<td style="text-align:left;">

Carlton
</td>

<td style="text-align:right;">

0.4291868
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

-5
</td>

<td style="text-align:left;">

Carlton
</td>

</tr>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

Hawthorn
</td>

<td style="text-align:left;">

Melbourne
</td>

<td style="text-align:right;">

0.3946709
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

-8
</td>

<td style="text-align:left;">

Melbourne
</td>

</tr>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

North Melbourne
</td>

<td style="text-align:left;">

Geelong Cats
</td>

<td style="text-align:right;">

0.6736972
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

13
</td>

<td style="text-align:left;">

North Melbourne
</td>

</tr>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

Richmond
</td>

<td style="text-align:left;">

Collingwood
</td>

<td style="text-align:right;">

0.4894225
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

-1
</td>

<td style="text-align:left;">

Collingwood
</td>

</tr>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

Gold Coast SUNS
</td>

<td style="text-align:left;">

Western Bulldogs
</td>

<td style="text-align:right;">

0.3555170
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

-8
</td>

<td style="text-align:left;">

Western Bulldogs
</td>

</tr>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

Essendon
</td>

<td style="text-align:left;">

Brisbane Lions
</td>

<td style="text-align:right;">

0.3640168
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

-7
</td>

<td style="text-align:left;">

Brisbane Lions
</td>

</tr>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

Adelaide Crows
</td>

<td style="text-align:left;">

Sydney Swans
</td>

<td style="text-align:right;">

0.5286363
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:left;">

Adelaide Crows
</td>

</tr>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

Fremantle
</td>

<td style="text-align:left;">

Port Adelaide
</td>

<td style="text-align:right;">

0.4779422
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

Fremantle
</td>

</tr>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

GWS GIANTS
</td>

<td style="text-align:left;">

West Coast Eagles
</td>

<td style="text-align:right;">

0.4262210
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

-1
</td>

<td style="text-align:left;">

West Coast Eagles
</td>

</tr>

</tbody>

</table>

## AFLM

For 2026, I have rebuilt sqwiggle to predict AFLM results. The predicted
ladder after round 21 is below.

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

Team name
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

<th style="text-align:right;">

Opponents to date
</th>

<th style="text-align:right;">

Opposition strength
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Fremantle
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

21
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-2.616
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Sydney Swans
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-1.630
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Hawthorn
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-0.152
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Adelaide Crows
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1.246
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Geelong Cats
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6.592
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Brisbane Lions
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-1.463
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(217, 217, 214, 1) !important;">

Western Bulldogs
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

11.781
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(217, 217, 214, 1) !important;">

Melbourne
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

-2
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

-5.709
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(217, 217, 214, 1) !important;">

Collingwood
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

2.858
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(217, 217, 214, 1) !important;">

GWS GIANTS
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

-3.419
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

St Kilda
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-5.034
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Carlton
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-2
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

2.337
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

North Melbourne
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-10.854
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Gold Coast SUNS
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

8.589
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Port Adelaide
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-7.166
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

West Coast Eagles
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-2.716
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Richmond
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-1.288
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(243, 229, 0, 1) !important;">

Essendon
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

8.808
</td>

</tr>

</tbody>

</table>

`Note: Opposition strength is the deviation from 1,500 of each team's mean opponent strength. Positive numbers indicate a team's mean opponent is above average strength, that is they have a harder than average draw. Opposition to date, is the number of above average teams played so far`

Here is a look at how positions are predicted to change over the
remainder of the year.

<img src="README_files/figure-gfm/table_over_year-1.png" alt="" width="2000" height="800" />

## Team strength

As an ELO model, Sqwiggle’s assessment of teams and predictive ability
is based on past performance. Sqwiggle learns as each round is played.
Sqwiggle accounts for distance travelled when calculating home ground
advantage.

Sqwiggle’s estimate of each team’s ELO score for the eight rounds up to
21 is shown below.

<img src="README_files/figure-gfm/sqwiggle_wiggle-1.png" alt="" width="2000" height="1500" />

Sqwiggle’s rank of each team based on their ELO score from the start of
the season to after round 21 is shown below.

<img src="README_files/figure-gfm/sqwiggle_rank-1.png" alt="" width="2000" height="1000" />

## How well did Sqwiggle go at tipping the AFLM in 2026

Keep track of tipping performance here as the season progresses.

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:right;">

Number
</th>

<th style="text-align:right;">

Correct
</th>

<th style="text-align:right;">

Games
</th>

<th style="text-align:right;">

Cumulative
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

4
</td>

</tr>

<tr>

<td style="text-align:right;">

1
</td>

<td style="text-align:right;">

8
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

12
</td>

</tr>

<tr>

<td style="text-align:right;">

2
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

17
</td>

</tr>

<tr>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

23
</td>

</tr>

<tr>

<td style="text-align:right;">

4
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

8
</td>

<td style="text-align:right;">

28
</td>

</tr>

<tr>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

33
</td>

</tr>

<tr>

<td style="text-align:right;">

6
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

40
</td>

</tr>

<tr>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

47
</td>

</tr>

<tr>

<td style="text-align:right;">

8
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

53
</td>

</tr>

<tr>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

62
</td>

</tr>

<tr>

<td style="text-align:right;">

10
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

67
</td>

</tr>

<tr>

<td style="text-align:right;">

11
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

71
</td>

</tr>

<tr>

<td style="text-align:right;">

12
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

76
</td>

</tr>

<tr>

<td style="text-align:right;">

13
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:right;">

8
</td>

<td style="text-align:right;">

80
</td>

</tr>

<tr>

<td style="text-align:right;">

14
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

85
</td>

</tr>

<tr>

<td style="text-align:right;">

15
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

91
</td>

</tr>

<tr>

<td style="text-align:right;">

16
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

97
</td>

</tr>

<tr>

<td style="text-align:right;">

17
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

102
</td>

</tr>

<tr>

<td style="text-align:right;">

18
</td>

<td style="text-align:right;">

8
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

110
</td>

</tr>

<tr>

<td style="text-align:right;">

19
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

116
</td>

</tr>

<tr>

<td style="text-align:right;">

20
</td>

<td style="text-align:right;">

8
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

124
</td>

</tr>

<tr>

<td style="text-align:right;">

21
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

131
</td>

</tr>

</tbody>

</table>

Sqwiggle’s tips for the next round of the AFLM are below.

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:right;">

Round
</th>

<th style="text-align:left;">

Home team
</th>

<th style="text-align:left;">

Away team
</th>

<th style="text-align:right;">

Prediction
</th>

<th style="text-align:right;">

Home game advantage
</th>

<th style="text-align:right;">

Margin predicted
</th>

<th style="text-align:left;">

Tip
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:left;">

Western Bulldogs
</td>

<td style="text-align:left;">

North Melbourne
</td>

<td style="text-align:right;">

0.5965192
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:left;">

Western Bulldogs
</td>

</tr>

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:left;">

Brisbane Lions
</td>

<td style="text-align:left;">

Hawthorn
</td>

<td style="text-align:right;">

0.4850800
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

Brisbane Lions
</td>

</tr>

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:left;">

Melbourne
</td>

<td style="text-align:left;">

Fremantle
</td>

<td style="text-align:right;">

0.4221040
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

-1
</td>

<td style="text-align:left;">

Fremantle
</td>

</tr>

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:left;">

Sydney Swans
</td>

<td style="text-align:left;">

Port Adelaide
</td>

<td style="text-align:right;">

0.5996637
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

Sydney Swans
</td>

</tr>

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:left;">

Geelong Cats
</td>

<td style="text-align:left;">

Essendon
</td>

<td style="text-align:right;">

0.7329375
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

17
</td>

<td style="text-align:left;">

Geelong Cats
</td>

</tr>

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:left;">

Adelaide Crows
</td>

<td style="text-align:left;">

Richmond
</td>

<td style="text-align:right;">

0.7261305
</td>

<td style="text-align:right;">

2
</td>

<td style="text-align:right;">

19
</td>

<td style="text-align:left;">

Adelaide Crows
</td>

</tr>

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:left;">

GWS GIANTS
</td>

<td style="text-align:left;">

Gold Coast SUNS
</td>

<td style="text-align:right;">

0.5144813
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

GWS GIANTS
</td>

</tr>

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:left;">

West Coast Eagles
</td>

<td style="text-align:left;">

Collingwood
</td>

<td style="text-align:right;">

0.3343841
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

-7
</td>

<td style="text-align:left;">

Collingwood
</td>

</tr>

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:left;">

St Kilda
</td>

<td style="text-align:left;">

Carlton
</td>

<td style="text-align:right;">

0.4984784
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

Carlton
</td>

</tr>

</tbody>

</table>
