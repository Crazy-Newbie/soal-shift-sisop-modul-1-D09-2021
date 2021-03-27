#!/bin/bash

#2a
export LC_ALL=C
awk '
BEGIN{FS="\t"}
{
	sales=$18
	profit=$21
	costprice=sales=profit
	ProfitPercentage=(profit/costprice)*100
	if(ProfitPercentage>1)
	{
		maxProfit=ProfitPercentage
		maxRow=$1
	}
}
END {
printf("Transaksi terakhir dengan persentase profit terbesar yaitu %d dengan persentase %d%%. \n", maxRow, maxProfit)}' Laporan-TokoShiSop.tsv >> hasil.txt

#2b
export LC_ALL=C
awk '
BEGIN{FS="\t"}
{
	if($2)
}

