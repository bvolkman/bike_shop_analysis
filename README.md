# bike_shop_analysis

## Query Results:
(*Results with many rows have a 10 row limit placed on them.)

Query 1: Calculates how long it took for each order to ship
|order_id|days_to_ship|
|--------|------------|
|1|2|
|2|2|
|3|1|
|4|2|
|5|3|
|6|1|
|7|1|
|8|1|
|9|3|
|10|1|
#
Query 2: Calculates the amount of revenue generated from the Santa Cruz Bikes store
|store_name|store_revenue|
|----------|-------------|
|Santa Cruz Bikes|1605822.75|
#
Query 3: Calculates the order total for each order 
|order_id|order_total|
|--------|-----------|
|1|10231.05|
|2|1697.97|
|3|1519.98|
|4|1349.98|
|5|3900.06|
|6|9442.50|
|7|2165.08|
|8|1372.47|
|9|7199.98|
|10|242.99|
#
Query 4: Counts the number of orders placed at each store
|store_id|orders_count|
|--------|------------|
|1|348|
|2|1093|
|3|174|
#
Query 5: Finds all of the customers with a phone number in the database
|customer_id|first_name|last_name|phone|email|street|city|state|zip_code|
|-----------|----------|---------|-----|-----|------|----|-----|--------|
|5|Charolette|Rice|(916) 381-6003|charolette.rice@msn.com|107 River Dr. |Sacramento|CA|95820|
|7|Latasha|Hays|(716) 986-3359|latasha.hays@hotmail.com|7014 Manor Station Rd. |Buffalo|NY|14215|
|12|Robby|Sykes|(516) 583-7761|robby.sykes@hotmail.com|486 Rock Maple Street |Hempstead|NY|11550|
|16|Emmitt|Sanchez|(212) 945-8823|emmitt.sanchez@hotmail.com|461 Squaw Creek Road |New York|NY|10002|
|26|Theo|Reese|(562) 215-2907|theo.reese@gmail.com|8755 W. Wild Horse St. |Long Beach|NY|11561|
|31|Williemae|Holloway|(510) 246-8375|williemae.holloway@msn.com|69 Cypress St. |Oakland|CA|94603|
|39|Janetta|Aguirre|(717) 670-2634|janetta.aguirre@aol.com|214 Second Court |Lancaster|NY|14086|
|43|Mozelle|Carter|(281) 489-9656|mozelle.carter@aol.com|895 Chestnut Ave. |Houston|TX|77016|
|56|Lolita|Mosley|(281) 363-3309|lolita.mosley@hotmail.com|376 S. High Ridge St. |Houston|TX|77016|
|67|Tommie|Melton|(916) 802-2952|tommie.melton@gmail.com|8 West Old York St. |Sacramento|CA|95820|
#
Query 6: Finds the number of items in each order
|order_id|total_items|
|--------|-----------|
|1|8|
|2|3|
|3|2|
|4|2|
|5|4|
|6|8|
|7|4|
|8|3|
|9|2|
|10|1|
#
Query 7: How much each customer spent across all of their orders
|customer_id|total_purchases|
|-----------|---------------|
|1|27888.19|
|2|19329.09|
|3|24051.53|
|4|21150.89|
|5|17520.29|
|6|32675.07|
|7|7147.16|
|8|2201.65|
|9|24433.88|
|10|33634.26|
#
Query 8: Which stores currently carry the product "Trek Kickster - 2018" and how many are in stock?
|store_id|store_name|product_id|product_name|quantity|
|--------|----------|----------|------------|--------|
|1|Santa Cruz Bikes|268|Trek Kickster - 2018|23|
|2|Baldwin Bikes|268|Trek Kickster - 2018|3|
|3|Rowlett Bikes|268|Trek Kickster - 2018|17|
#
Query 9: Number of sales and total revenue each year
|sales_year|sales_count|sales_revenue|
|----------|-----------|-------------|
|2015.0|2|11929|
|2016.0|633|2415450|
|2017.0|691|3467354|
|2018.0|289|1794384|
#
Query 10: Number of sales per employee
|store_id|employee|orders_sold|
|--------|--------|-----------|
|2|Marcelene Boyer|553|
|2|Venita Daniel|540|
|1|Genna Serrano|184|
|1|Mireya Copeland|164|
|3|Kali Vargas|88|
|3|Layla Terrell|86|
#
Query 11: Which stores are out of stock on a product?
|store_id|store_name|product_id|product_name|quantity|
|--------|----------|----------|------------|--------|
|3|Rowlett Bikes|3|Surly Wednesday Frameset - 2016|0|
|1|Santa Cruz Bikes|6|Surly Ice Cream Truck Frameset - 2016|0|
|1|Santa Cruz Bikes|8|Trek Remedy 29 Carbon Frameset - 2016|0|
|2|Baldwin Bikes|22|Electra Girl's Hawaii 1 (16-inch) - 2015/2016|0|
|1|Santa Cruz Bikes|32|Trek Farley Alloy Frameset - 2017|0|
|1|Santa Cruz Bikes|42|Trek Fuel EX 5 27.5 Plus - 2017|0|
|2|Baldwin Bikes|47|Trek Remedy 9.8 - 2017|0|
|3|Rowlett Bikes|59|Trek Domane S 5 Disc - 2017|0|
|2|Baldwin Bikes|91|Trek Precaliber 24 (21-Speed) - Girls - 2017|0|
|1|Santa Cruz Bikes|92|Haro Shredder 20 - 2017|0|
|2|Baldwin Bikes|158|Trek CrossRip 1 - 2018|0|
|1|Santa Cruz Bikes|160|Trek Emonda SLR 6 - 2018|0|
|1|Santa Cruz Bikes|163|Surly Pack Rat - 2018|0|
|1|Santa Cruz Bikes|168|Surly Straggler - 2018|0|
|2|Baldwin Bikes|175|Trek Domane SLR Frameset - 2018|0|
|2|Baldwin Bikes|184|Trek Domane SL 6 Disc - 2018|0|
|2|Baldwin Bikes|192|Electra Townie Go! 8i - 2017/2018|0|
|2|Baldwin Bikes|198|Electra Townie Commute Go! - 2018|0|
|3|Rowlett Bikes|220|Electra Cruiser 1 Ladies' - 2018|0|
|1|Santa Cruz Bikes|246|Electra Townie Original 3i EQ Ladies' - 2018|0|
|2|Baldwin Bikes|251|Electra Townie Commute Go! - 2018|0|
|3|Rowlett Bikes|259|Electra Amsterdam Royal 8i Ladies - 2018|0|
|2|Baldwin Bikes|299|Electra Townie Original 21D - 2018|0|
|1|Santa Cruz Bikes|302|Electra Townie Original 1 - 2018|0|
|3|Rowlett Bikes|313|Electra Townie Original 1 Ladies' - 2018|0|
#
Query 12: Show the top 10 selling products and the total units sold at each store, then rank the stores based on their sales of that product.
|product_id|product_name|store_id|store_rank|store_units_sold|
|----------|------------|--------|----------|----------------|
|6|Surly Ice Cream Truck Frameset - 2016|2|1|113|
|23|Electra Girl's Hawaii 1 (20-inch) - 2015/2016|2|1|111|
|16|Electra Townie Original 7D EQ - 2016|2|1|107|
|13|Electra Cruiser 1 (24-Inch) - 2016|2|1|107|
|12|Electra Townie Original 21D - 2016|2|1|105|
|25|Electra Townie Original 7D - 2015/2016|2|1|103|
|11|Surly Straggler 650b - 2016|2|1|101|
|7|Trek Slash 8 27.5 - 2016|2|1|101|
|10|Surly Straggler - 2016|2|1|100|
|9|Trek Conduit+ - 2016|2|1|93|
|9|Trek Conduit+ - 2016|1|2|39|
|11|Surly Straggler 650b - 2016|1|2|38|
|10|Surly Straggler - 2016|1|2|36|
|25|Electra Townie Original 7D - 2015/2016|1|2|34|
|6|Surly Ice Cream Truck Frameset - 2016|1|2|34|
|16|Electra Townie Original 7D EQ - 2016|1|2|33|
|7|Trek Slash 8 27.5 - 2016|1|2|32|
|23|Electra Girl's Hawaii 1 (20-inch) - 2015/2016|1|2|31|
|12|Electra Townie Original 21D - 2016|1|2|29|
|13|Electra Cruiser 1 (24-Inch) - 2016|1|2|26|
|13|Electra Cruiser 1 (24-Inch) - 2016|3|3|24|
|7|Trek Slash 8 27.5 - 2016|3|3|21|
|6|Surly Ice Cream Truck Frameset - 2016|3|3|20|
|12|Electra Townie Original 21D - 2016|3|3|19|
|16|Electra Townie Original 7D EQ - 2016|3|3|16|
|9|Trek Conduit+ - 2016|3|3|13|
|11|Surly Straggler 650b - 2016|3|3|12|
|23|Electra Girl's Hawaii 1 (20-inch) - 2015/2016|3|3|12|
|10|Surly Straggler - 2016|3|3|11|
|25|Electra Townie Original 7D - 2015/2016|3|3|11|
