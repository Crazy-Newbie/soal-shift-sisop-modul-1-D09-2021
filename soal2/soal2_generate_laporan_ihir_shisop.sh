# 2a
awk -F "\t" '
BEGIN{
    biggestID = 0;
    maxprofit = 0;
}

# body
{
    id = $1;
    profit = $21;
    sales = $18;
    if(NR > 1){
        costprice = sales - profit;
        percentage = (profit / costprice) * 100;
        if (maxprofit < percentage){
            maxprofit = percentage;
            biggestID = id;
        }
        else if(maxprofit == percentage){            
            biggestID = id;            
        }
    }
}

# END BLOCK
END{
  printf "Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentase %.f%%\n", biggestID, maxprofit;
}' /home/rizaldinur/soal2/Laporan-TokoShiSop.tsv > /home/rizaldinur/soal2/hasil.txt

# 2b
awk -F "\t" '
BEGIN{
    print "\nDaftar nama customer di Albuquerque pada tahun 2017 antara lain:"
}
# body
{
    year= substr($3,7,2);
    city = $10;
    if(city == "Albuquerque" && year == 17){
        namakota[$7] ;
    }
}
END{
    for( nama in namakota ){
    	print nama;
    }
}' /home/rizaldinur/soal2/Laporan-TokoShiSop.tsv >> /home/rizaldinur/soal2/hasil.txt

# 2c
awk -F "\t" '

# body
{
    if($8 == "Consumer"){
        customer++;
    }
    else if($8 == "Corporate"){
        corp++;
    }
    else if($8 == "Home Office"){
        home++;
    }
}
END{
    if (customer <= corp && customer <= home){
        minTrac = customer;
        minSeg = "Consumer";
    }
     
    else if (corp <= customer && corp <= home){
        minTrac = corp;
        minSeg = "Corporate";
  
    }
       
    else{
        minTrac = home;
        minSeg = "Home Office";
    }
  
    printf "\nTipe segmen customer yang penjualannya paling sedikit adalah %s dengan %d transaksi.\n",minSeg,minTrac;

}' /home/rizaldinur/soal2/Laporan-TokoShiSop.tsv >> /home/rizaldinur/soal2/hasil.txt

# 2d
awk -F "\t" '
BEGIN{
    i=0;
    j=0;
    k=0;
    l=0;
    sumC=0;
    sumE=0;
    sumW=0;
    sumS=0;
}
{
    if($13 == "Central"){
        central[i]=$21;
        sumC= sumC + central[i];
        i++;
    }
    else if($13 == "East"){
        east[j]=$21;
        sumE= sumE + east[j];
        j++;
    }
    else if($13 == "West"){
        west[k]=$21;
        sumW= sumW + west[k];
        k++;
    }
    else if($13 == "South"){
        south[l]=$21;
        sumS= sumS + south[l];
        l++;
    }
}
END{
    if(sumC < sumE && sumC < sumW && sumC < sumS){
        minReg= "Central";
        profit = sumC;
    }
    else if(sumE < sumC && sumE < sumW && sumE < sumS){
        minReg= "East";
        profit = sumE;
    }
    else if(sumW < sumC && sumW < sumE && sumW < sumS){
        minReg= "West";
        profit = sumW;
    }
    else{
        minReg= "South";
        profit = sumS;
    }
    printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %.3f",minReg, profit;
}' /home/rizaldinur/soal2/Laporan-TokoShiSop.tsv >> /home/rizaldinur/soal2/hasil.txt
