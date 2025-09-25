 #!/bin/bash

start=$(date +%s)

for i in $(seq 1 1000)
do
  filename=$(printf "%04d.txt" $i)
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  neutrinos=$((RANDOM % 11))
  echo "$timestamp - neutrinos: $neutrinos" > "simulaciones/$filename"
done

cat simulaciones/ *.txt > results.txt

end=$(date +%s)
runtime=$((end - start))

echo "Tiempo total: $runtime segundos" > performance.txt
echo "Tiempo promedio por evento: $(echo "scale=3; $runtime/1000" | bc) segundos" >> performance.txt




