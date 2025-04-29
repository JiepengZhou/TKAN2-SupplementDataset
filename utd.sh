#!/bin/bash

# 检查是否传入了两个参数
if [ $# -ne 2 ]; then
  echo "Usage: $0 <folder_name> <output_path>"
  exit 1
fi

# 使用用户输入的文件夹名称和输出路径
FOLDER_NAME=$1
OUTPUT_PATH=$2

# 检查文件夹是否存在
if [ ! -d "$FOLDER_NAME" ]; then
  echo "Error: Folder '$FOLDER_NAME' does not exist."
  exit 1
fi

# 切换到指定文件夹
cd "$FOLDER_NAME" || exit

# 解压所有 .tar.gz 文件到指定输出路径
for file in *.tar.gz; do
  if [ -e "$file" ]; then
    # 确保目标路径存在
    mkdir -p "$OUTPUT_PATH"

    # 解压文件
    tar -xzvf "$file" -C "$OUTPUT_PATH"
  else
    echo "No .tar.gz files found in $FOLDER_NAME"
    break
  fi
done