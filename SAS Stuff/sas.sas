/* Define macro */
%macro customer_report(input_table=, output_table=);

    /* Move to report table */
    data &output_table;
        set &input_table;
    run;

    /* Print the report */
    proc print data=&output_table noobs;
        title "Customer Sales Report";
    run;

%mend customer_report;

/* Create customer data */
data work.customers;
    input CustomerID $ Name $ Region $ Sales;
    datalines;
C001 Alice North 5200
C002 Bob South 3800
C003 Carol East  7100
C004 Dave West  4500
;
run;

/* Call the macro */
%customer_report(input_table=work.customers, output_table=work.customer_report);
