# Attribution


<h2 style="color:rgb(100,81,138)">Helpful Links</h2>

Read: [Introduction to Attribution](https://segment.com/academy/collecting-data/an-introduction-to-multi-touch-attribution/)


<h2 style="color:rgb(100,81,138)">Overview</h2>

In this demo, we've specified three different types of attribution.

  1.  __First Touch Attribution__ - Depends entirely on how the user was first acquired. The channel that the user first came in through the site for the very first time gets full credit for all purchases made by the user.

  2.  __Last Touch Attribution__ - The session that the purchase was made in gets full credit for the purchase.

  3.  __Multi-Touch Linear Attribution__ - Every session leading up to a purchase gets equal weight for the purchase


Session Purchase Facts is a PDT that sessionizes the session table based on purchases. It contains dimensions such as sessions_till_purchase and sale_price to help identify how revenue should be distributed back across the table. It is joined back into the sessions table and revenue can be looked at as attributes of the session table, like session.traffice_source, purchase_session_source, etc...


<h2 style="color:rgb(100,81,138)">Examples</h2>
Let's say we have the following data:
<br />

User ID | Session Rank | Traffic Source | Is Purchase Session | Purchase Amount
--------|--------------|----------------|---------------------|----------------
1       | 1            | Adwords        |                     |
1       | 2            | Facebook       |                     |
1       | 3            | Facebook       | Yes                 | $75
1       | 4            | Organic        | Yes                 | $50
1       | 5            | Email          |                     |
1       | 6            | Adwords        |                     |
1       | 7            | Organic        |                     |
1       | 8            | Organic        | Yes                 | $50
1       | 9            | Facebook       |                     |
1       | 10           | Adwords        |                     |
2       | 1            | Facebook       |                     |
2       | 2            | Adwords        |                     |
2       | 3            | Adwords        |                     |
2       | 4            | Organic        | Yes                 | $100
3       | 1            | Adwords        |                     |
3       | 2            | Organic        |                     |

## First Touch Attribution

If we were using a first touch attribution model, the result would look like:

User Acquisition Source | Purchase Amount Attributed
------------------------|---------------------------
Adwords                 | $175
Facebook                | $100

For user 1, their first source was originally Adwords, so 100% of their ultimate purchase amount gets attributed to Adwords.
For user 2, their originating source was Facebook, so Facebook gets attributed the total purchase amount of $100.

This is stored in the following dimension which lives in the user_session_fact table. This table is rolled up to the user level:

```
dimension: site_acquisition_source {
type: string
}
```

## Last Touch Attribution

On the other hand, with last touch attribution, the session in which the puchase happened gets credit for the sale:

Session Purchase Source | Purchase Amount Attributed
------------------------|---------------------------
Organic                 | $200
Facebook                | $70

In looker, this is defined in the following dimension which lives in the session_purchase_facts table outlined above:

```
dimension: purchase_session_source {
view_label: "Sessions"
description: "Last Touch Attribution: Source of last session before purchase"
type: string
sql: ${TABLE}.purchase_session_traffic_source ;;
}

```

## Multi-Touch Linear Attribution

In a linear model, all touches get an equal weight of attribution. For example, let's take user 1's first purchase of $75.  In that case the relevant lines are:

User ID | Session Rank | Traffic Source | Is Purchase Session | Purchase Amount
--------|--------------|----------------|---------------------|----------------
1       | 1            | Adwords        |                     |
1       | 2            | Facebook       |                     |
1       | 3            | Facebook       | Yes                 | $75

Therefore, for that purchase, attribution would look like because each traffic source would split the $75 in equal proportions:

Session Purchase Source | Purchase Amount Attributed
------------------------|---------------------------
Adwords                 | $25
Facebook                | $50

The corresponding dimension is `traffic source` from the sessions table:

```
dimension: traffic_source {
type: string
}
```
