ls RGBTSDataset/*.csv | xargs -n 2 | while read file1 file2; do
  base1=$(basename "$file1" .csv)
  base2=$(basename "$file2" .csv)
  tar -czf "${base1}_${base2}.tar.gz" -C RGBTSDataset "$(basename "$file1")" "$(basename "$file2")"
done