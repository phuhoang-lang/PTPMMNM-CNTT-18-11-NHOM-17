# WebAccessTest

**Công cụ kiểm thử tự động quyền truy cập trong ứng dụng Web**

WebAccessTest là dự án mã nguồn mở hướng đến việc tự động hóa quá trình kiểm thử quyền truy cập trong ứng dụng Web. Công cụ gửi các yêu cầu HTTP đến ứng dụng được phép kiểm tra, đối chiếu phản hồi thực tế với quyền truy cập mong đợi và tạo báo cáo giúp phát hiện các lỗi phân quyền.

Dự án được thực hiện trong khuôn khổ môn học **Phát triển phần mềm mã nguồn mở**.

> **Trạng thái dự án:** Đang phát triển.

## 1. Mục tiêu dự án

Trong một ứng dụng Web, việc khai báo quyền truy cập đúng chưa đảm bảo rằng dữ liệu được bảo vệ an toàn. Một lỗi phân quyền có thể khiến người dùng truy cập chức năng quản trị hoặc đọc dữ liệu riêng của người dùng khác.

WebAccessTest hướng đến việc giải quyết vấn đề này thông qua các ca kiểm thử tự động, giúp nhóm phát triển phát hiện và xác minh lỗi phân quyền trước và sau khi sửa lỗi.

## 2. Chức năng chính

- **Quản lý dự án kiểm thử:** Quản lý vai trò người dùng, tài nguyên, hành động và chủ sở hữu bản ghi.
- **Khai báo ca kiểm thử:** Cấu hình tài khoản, yêu cầu HTTP, quyền mong đợi và kết quả phản hồi cần kiểm tra.
- **Ứng dụng Web mẫu:** Xây dựng ứng dụng PHP với các API, dữ liệu riêng, dữ liệu dùng chung và lỗi phân quyền được tạo có chủ đích.
- **Thực thi kiểm thử HTTP:** Gửi yêu cầu đến máy chủ được cho phép, ghi nhận mã phản hồi, kết quả kiểm thử và lỗi kết nối.
- **Quản lý lịch sử và báo cáo:** Lưu các lần chạy, so sánh kết quả trước và sau khi sửa lỗi, xuất báo cáo và hỗ trợ chạy kiểm thử bằng dòng lệnh (CLI).

## 3. Yêu cầu kiểm thử

Dự án hướng đến việc đáp ứng các yêu cầu sau:

- Kiểm tra quyền truy cập theo vai trò và quyền sở hữu dữ liệu.
- Từ chối các quyền chưa được khai báo.
- Gọi API thực tế của ứng dụng mẫu và phát hiện lỗi phân quyền được tạo có chủ đích.
- Phân biệt lỗi chạy, chẳng hạn như mất kết nối hoặc hết thời gian chờ, với kết quả từ chối truy cập.
- Kiểm tra quyền xem và chỉnh sửa bộ ca thử giữa các nhóm.
- Không ghi mật khẩu hoặc mã truy cập nguyên văn vào báo cáo và nhật ký.
- Sử dụng chung cấu hình ca thử giữa giao diện Web và CLI.

## 4. Phạm vi dự án

Theo yêu cầu đề tài, bộ dữ liệu kiểm thử cần có tối thiểu:

| Thành phần | Yêu cầu |
|---|---|
| Vai trò người dùng | Ít nhất 3 |
| Địa chỉ API | Ít nhất 6 |
| Ca kiểm thử HTTP | Ít nhất 24 |
| Dữ liệu người dùng | Có bản ghi của ít nhất 2 tài khoản khác nhau |

Phạm vi kiểm thử chỉ giới hạn ở các dịch vụ cục bộ do nhóm quản lý và các máy chủ được cấu hình cho phép.

## 5. Công nghệ dự kiến

- **Python:** Xây dựng bộ máy kiểm thử HTTP và xử lý kết quả.
- **PHP:** Xây dựng ứng dụng Web mẫu phục vụ kiểm thử.
- **SQLite:** Lưu trữ cấu hình dự án, ca kiểm thử và lịch sử chạy.
- **Git và GitHub:** Quản lý mã nguồn và phối hợp phát triển.

Các công nghệ trên là phương án dự kiến và có thể được điều chỉnh trong quá trình thiết kế, triển khai.

## 6. Cấu trúc dự án dự kiến

```text
WebAccessTest/
├── app/                 # Ứng dụng PHP mẫu
├── engine/              # Bộ máy kiểm thử HTTP
├── web/                 # Giao diện quản lý và báo cáo
├── cli/                 # Công cụ chạy kiểm thử bằng dòng lệnh
├── config/              # Cấu hình dự án và máy chủ được phép
├── testcases/           # Ca kiểm thử và quy tắc phân quyền
├── tests/               # Kiểm thử tự động
├── reports/             # Báo cáo được tạo khi chạy
├── docs/                # Tài liệu dự án
├── .github/
│   └── workflows/       # Quy trình CI/CD dự kiến
├── README.md
├── requirements.txt
├── composer.json
├── LICENSE
└── .gitignore
```

Cấu trúc này là bản phác thảo ban đầu; các thư mục và tệp sẽ được bổ sung khi chức năng tương ứng được triển khai.

## 7. Cài đặt và sử dụng

**Trạng thái:** Đang xây dựng hướng dẫn cài đặt và chạy thử.

Hướng dẫn hoàn chỉnh sẽ được bổ sung sau khi các thành phần chính của dự án được triển khai. Tài liệu sẽ bao gồm:

1. Các yêu cầu về môi trường.
2. Cách tải mã nguồn và cài đặt thư viện.
3. Cách khởi chạy ứng dụng PHP mẫu.
4. Cách cấu hình và thực thi bộ kiểm thử.
5. Cách xem lịch sử chạy và xuất báo cáo.
6. Cách chạy kiểm thử bằng CLI.

## 8. Kết quả dự kiến

Khi hoàn thành, WebAccessTest hướng đến việc cung cấp một quy trình kiểm thử có thể tái sử dụng, cho phép:

- Phát hiện lỗi phân quyền trên ứng dụng mẫu.
- Xác minh lỗi đã được sửa bằng cách chạy lại cùng ca kiểm thử.
- Theo dõi kết quả và lịch sử kiểm thử.
- Tái sử dụng bộ ca thử thông qua giao diện Web và CLI.
- Hỗ trợ nhóm phát triển kiểm tra các thay đổi và hạn chế lỗi phân quyền tái xuất hiện.

## 9. Đóng góp

Dự án hướng đến việc áp dụng các thực hành phát triển phần mềm mã nguồn mở, bao gồm quản lý mã nguồn bằng Git, theo dõi công việc qua Issues, xem xét thay đổi qua Pull Requests và cung cấp tài liệu sử dụng.

Quy trình đóng góp chi tiết sẽ được bổ sung khi repository được thiết lập.

## 10. Giấy phép

Giấy phép mã nguồn mở sẽ được lựa chọn và bổ sung trong quá trình hoàn thiện dự án.

---

**WebAccessTest** — Hỗ trợ kiểm thử quyền truy cập Web một cách có hệ thống, tự động và có thể kiểm chứng.
