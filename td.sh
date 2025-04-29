#!/bin/bash

# 检查是否传入了两个参数
if [ $# -ne 2 ]; then
  echo "Usage: $0 <folder_name> <output_path>"
  exit 1
fi

# 使用用户输入的文件夹名称和输出路径
FOLDER_NAME=$1
OUTPUT_PATH=$2

# 检查输入文件夹是否存在
if [ ! -d "$FOLDER_NAME" ]; then
  echo "Error: Folder '$FOLDER_NAME' does not exist."
  exit 1
fi

# 检查输出路径是否存在，如果不存在则创建
if [ ! -d "$OUTPUT_PATH" ]; then
  echo "Output path '$OUTPUT_PATH' does not exist. Creating it..."
  mkdir -p "$OUTPUT_PATH"
fi

# 遍历文件并压缩到指定输出路径
ls "$FOLDER_NAME"/*.csv | xargs -n 2 | while read file1 file2; do
  base1=$(basename "$file1" .csv)
  base2=$(basename "$file2" .csv)
  tar -czf "$OUTPUT_PATH/${base1}_${base2}.tar.gz" -C "$FOLDER_NAME" "$(basename "$file1")" "$(basename "$file2")"
done