
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

The predicted AFLW ladder after round 1 is below.

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

1
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

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2.263
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Melbourne
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3.178
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Brisbane Lions
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1.713
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Carlton
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7.827
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Western Bulldogs
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0.202
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

10
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

9.362
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

18
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-11.028
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Port Adelaide
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-5.293
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

6
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

2.911
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Sydney Swans
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

6.520
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

5
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-6.946
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

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-12.729
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

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

5.269
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Richmond
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-1.487
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

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-3
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11.771
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

GWS GIANTS
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-6.047
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

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

17
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-3.125
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

17
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

18
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

-1
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

-4.361
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

2
</td>

<td style="text-align:left;">

Western Bulldogs
</td>

<td style="text-align:left;">

Richmond
</td>

<td style="text-align:right;">

0.5754952
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:left;">

Western Bulldogs
</td>

</tr>

<tr>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

West Coast Eagles
</td>

<td style="text-align:left;">

Gold Coast SUNS
</td>

<td style="text-align:right;">

0.5909976
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:right;">

11
</td>

<td style="text-align:left;">

West Coast Eagles
</td>

</tr>

<tr>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

Geelong Cats
</td>

<td style="text-align:left;">

St Kilda
</td>

<td style="text-align:right;">

0.5092668
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

Geelong Cats
</td>

</tr>

<tr>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

Brisbane Lions
</td>

<td style="text-align:left;">

North Melbourne
</td>

<td style="text-align:right;">

0.4158096
</td>

<td style="text-align:right;">

2
</td>

<td style="text-align:right;">

-4
</td>

<td style="text-align:left;">

North Melbourne
</td>

</tr>

<tr>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

Sydney Swans
</td>

<td style="text-align:left;">

Essendon
</td>

<td style="text-align:right;">

0.5724406
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:left;">

Sydney Swans
</td>

</tr>

<tr>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

Collingwood
</td>

<td style="text-align:left;">

Fremantle
</td>

<td style="text-align:right;">

0.4646349
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

Collingwood
</td>

</tr>

<tr>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

Melbourne
</td>

<td style="text-align:left;">

GWS GIANTS
</td>

<td style="text-align:right;">

0.6292411
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:right;">

11
</td>

<td style="text-align:left;">

Melbourne
</td>

</tr>

<tr>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

Carlton
</td>

<td style="text-align:left;">

Adelaide Crows
</td>

<td style="text-align:right;">

0.5224208
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:left;">

Carlton
</td>

</tr>

<tr>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

Port Adelaide
</td>

<td style="text-align:left;">

Hawthorn
</td>

<td style="text-align:right;">

0.5463071
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:left;">

Port Adelaide
</td>

</tr>

</tbody>

</table>

<img src="README_files/figure-gfm/table_over_year-1.png" alt="" width="2000" height="800" />

## AFLM

For 2026, I have rebuilt sqwiggle to predict AFLM results. The predicted
ladder after round 23 is below.

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

19
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

20
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-2.509
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Sydney Swans
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

17
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

-1.921
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Melbourne
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

16
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-6.763
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Geelong Cats
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6.654
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Brisbane Lions
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

3
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-2
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

-2.019
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(136, 219, 223, 1) !important;">

Adelaide Crows
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

6
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

5
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(136, 219, 223, 1) !important;">

1.562
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(217, 217, 214, 1) !important;">

Hawthorn
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

4
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

-3
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

0.107
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(217, 217, 214, 1) !important;">

Collingwood
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

7
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

3.037
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

12
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

15
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

12.740
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(217, 217, 214, 1) !important;">

St Kilda
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

1
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(217, 217, 214, 1) !important;">

-4.953
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Carlton
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-1
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

1.869
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

GWS GIANTS
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

10
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

10
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-3.792
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

North Melbourne
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-10.563
</td>

</tr>

<tr>

<td style="text-align:left;background-color: rgba(255, 255, 255, 1) !important;">

Gold Coast SUNS
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

8
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

12
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

14
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

9.053
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

15
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

0
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

13
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-6.560
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

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-3.033
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

11
</td>

<td style="text-align:right;background-color: rgba(255, 255, 255, 1) !important;">

-1.387
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

14
</td>

<td style="text-align:right;background-color: rgba(243, 229, 0, 1) !important;">

8.641
</td>

</tr>

</tbody>

</table>

`Note: Opposition strength is the deviation from 1,500 of each team's mean opponent strength. Positive numbers indicate a team's mean opponent is above average strength, that is they have a harder than average draw. Opposition to date, is the number of above average teams played so far`

## Team strength

As an ELO model, Sqwiggle’s assessment of teams and predictive ability
is based on past performance. Sqwiggle learns as each round is played.
Sqwiggle accounts for distance travelled when calculating home ground
advantage.

Sqwiggle’s estimate of each team’s ELO score for the eight rounds up to
23 is shown below.

<img src="README_files/figure-gfm/sqwiggle_wiggle-1.png" alt="" width="2000" height="1500" />

Sqwiggle’s rank of each team based on their ELO score from the start of
the season to after round 23 is shown below.

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

<tr>

<td style="text-align:right;">

22
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

137
</td>

</tr>

<tr>

<td style="text-align:right;">

23
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:right;">

144
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

24
</td>

<td style="text-align:left;">

St Kilda
</td>

<td style="text-align:left;">

Gold Coast SUNS
</td>

<td style="text-align:right;">

0.4963006
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:left;">

St Kilda
</td>

</tr>

<tr>

<td style="text-align:right;">

24
</td>

<td style="text-align:left;">

Collingwood
</td>

<td style="text-align:left;">

Brisbane Lions
</td>

<td style="text-align:right;">

0.4563497
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

Collingwood
</td>

</tr>

<tr>

<td style="text-align:right;">

24
</td>

<td style="text-align:left;">

Carlton
</td>

<td style="text-align:left;">

Fremantle
</td>

<td style="text-align:right;">

0.4097187
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

-2
</td>

<td style="text-align:left;">

Fremantle
</td>

</tr>

<tr>

<td style="text-align:right;">

24
</td>

<td style="text-align:left;">

Melbourne
</td>

<td style="text-align:left;">

Western Bulldogs
</td>

<td style="text-align:right;">

0.5067627
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

Melbourne
</td>

</tr>

<tr>

<td style="text-align:right;">

24
</td>

<td style="text-align:left;">

Geelong Cats
</td>

<td style="text-align:left;">

Richmond
</td>

<td style="text-align:right;">

0.7442387
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

18
</td>

<td style="text-align:left;">

Geelong Cats
</td>

</tr>

<tr>

<td style="text-align:right;">

24
</td>

<td style="text-align:left;">

Adelaide Crows
</td>

<td style="text-align:left;">

GWS GIANTS
</td>

<td style="text-align:right;">

0.5526551
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:left;">

Adelaide Crows
</td>

</tr>

<tr>

<td style="text-align:right;">

24
</td>

<td style="text-align:left;">

Essendon
</td>

<td style="text-align:left;">

Port Adelaide
</td>

<td style="text-align:right;">

0.4079646
</td>

<td style="text-align:right;">

2
</td>

<td style="text-align:right;">

-5
</td>

<td style="text-align:left;">

Port Adelaide
</td>

</tr>

<tr>

<td style="text-align:right;">

24
</td>

<td style="text-align:left;">

Sydney Swans
</td>

<td style="text-align:left;">

North Melbourne
</td>

<td style="text-align:right;">

0.6272707
</td>

<td style="text-align:right;">

2
</td>

<td style="text-align:right;">

12
</td>

<td style="text-align:left;">

Sydney Swans
</td>

</tr>

<tr>

<td style="text-align:right;">

24
</td>

<td style="text-align:left;">

West Coast Eagles
</td>

<td style="text-align:left;">

Hawthorn
</td>

<td style="text-align:right;">

0.3007761
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:right;">

-10
</td>

<td style="text-align:left;">

Hawthorn
</td>

</tr>

</tbody>

</table>
