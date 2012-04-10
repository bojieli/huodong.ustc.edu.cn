while [ 1 ];
do
read barcode
curl "http://localhost/blind?action=updatebarcode&barcode=$barcode"
done
