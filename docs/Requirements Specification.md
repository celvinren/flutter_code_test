System A has produced the file Input.txt, which is a Fixed Width text file that contains the Future Transactions done by client 1234

## Requirements:

* The Business user would like to see the TOTAL Transaction Amount of each UNIQUE product they have done for the DAY
* The Business user would like a program that can read in the Input file and generate a daily summary report
* The Daily summary report should be:
  1. Displayed on a (web/mobile) page in tabular form
  2. For the full-stack role, expose the data through an API which is then consumed by a front-end page

The Daily Summary Report has the following Header Line (first line):

- Client_Information
- Product_Information
- Total_Transaction_Amount

Client_Information should be a combination of the CLIENT TYPE, CLIENT NUMBER, ACCOUNT NUMBER, SUBACCOUNT NUMBER fields from Input file

Product_Information should be a combination of the EXCHANGE CODE, PRODUCT GROUP CODE, SYMBOL, EXPIRATION DATE

Total_Transaction_Amount should be a Net Total of the (QUANTITY LONG - QUANTITY SHORT) values for each client per product

Notes: 
* Each Record in the input file represents ONE Transaction from the client for a particular product.
