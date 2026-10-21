#!/usr/bin/env bash
set -u

# Lấy đường dẫn thư mục cần quét (mặc định là thư mục hiện tại)
target_dir="${1:-.}"

# Kiểm tra đầu vào: Nếu thư mục không tồn tại -> báo lỗi và thoát mã 2
if [[ ! -d "$target_dir" ]]; then
    echo "Thư mục không tồn tại: $target_dir" >&2
    exit 2
fi

total=0
pass=0
fail=0

# Duyệt đệ quy qua các tệp PHP (sử dụng đúng cú pháp read -r -d '')
while IFS= read -r -d '' file; do
    total=$((total + 1))
    if php -l "$file" >/dev/null 2>&1; then
        pass=$((pass + 1))
    else
        fail=$((fail + 1))
    fi
done < <(find "$target_dir" -type f -name "*.php" -print0)

# Nếu không tìm thấy tệp PHP nào -> báo lỗi và thoát mã 2
if [[ $total -eq 0 ]]; then
    echo "Không tìm thấy tệp PHP nào trong thư mục." >&2
    exit 2
fi

# Tổng hợp kết quả in ra màn hình
echo "TOTAL=$total PASS=$pass FAIL=$fail"

# Trả về mã thoát phù hợp
if [[ $fail -gt 0 ]]; then
    exit 1
else
    exit 0
fi