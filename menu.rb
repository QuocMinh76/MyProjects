M = 10 #dùng cho bảng băm kết nối trực tiếp

choice = 1
while (choice >= 1 && choice <= 6)
    puts "\e[H\e[2J" #Xóa màn hình
    print("---- CÁC CẤU TRÚC DỮ LIỆU ----\n1. Danh sách đặc\n2. Danh sách liên kết\n3. Stack\n4. Queue\n5. Cây nhị phân tìm kiếm\n6. Bảng băm\n7. Thoát chương trình\n")
    print("Bạn chọn: ")
    choice = gets.chomp.to_i
    
    case choice
    when 1
        load "array.rb"
    when 2
        load "linked.rb"
    when 3
        load "stackLIFO.rb"
    when 4
        load "queueFIFO.rb"
    when 5
        load "bstree.rb"
    when 6
        load "chaining.rb"
    else
        puts "\nThoát chương trình. Tạm biệt~"
    end

    if (choice >= 1 && choice <= 6)
        puts "\nNhấn phím ENTER để tiếp tục"
        pause = $stdin.gets.chomp #Tương tự lệnh _getch() trong C++, chờ input rồi mới tiếp tục
    end
end