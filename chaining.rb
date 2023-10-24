#M = 10 #khi chạy menu thì ghi chú dòng này lại, vì chương trình sẽ cảnh báo khi chạy một file có khai báo biến hằng (khi chạy lần 2 thì biến hằng được khai báo lại)
heads = Array.new(M)

class LinkedList
    attr_accessor :head
    def initialize()
        self.head = nil
    end

    #thêm giá trị tăng dần vào dslk
    def addAsc(value)
        if(self.head.nil?)
            self.head = Node.new(value, nil)
        elsif(value <= self.head.value)
            p = Node.new(value, nil)
            p.nextNode = self.head
            self.head = p
        else
            p = self.head
            while(p.nextNode != nil && p.nextNode.value < value)
                p = p.nextNode
            end
            p.nextNode = Node.new(value, nil)
        end
    end

    #tìm giá trị m
    def search(m)
        p = self.head
        if (p.nil?)
            return 0
        end
        while (!p.nextNode.nil? && p.value != m)
            p = p.nextNode
        end
        if (p.value == m)
            return 1
        else
            return 0
        end
    end

    #xóa giá trị m
    def deleteN(m)
        p = self.head
        if (p.nil?)
            return 0
        end
        if (p.nextNode.nil?) #ds chỉ có một phần tử
            self.head = nil
            return 0
        else
            q = Node.new(nil, nil)
            while (!p.nil?)
                if (p.value == m)
                    if (q.nextNode.nil?)
                        self.head = p.nextNode
                        p = nil
                        break
                    else
                        q.nextNode = p.nextNode
                        p = nil
                        q = nil
                        break
                    end
                end

                q = p
                p = p.nextNode
            end
        end
        return 1
    end

    #xuất dslk
    def output()
        p = self.head
        while(!p.nil?)
            print("#{p.value} -> ")
            p = p.nextNode
        end
        print "NULL"
        puts "\n"
    end

    class Node
        attr_accessor :value, :nextNode
        def initialize(value, nextNode)
            self.value = value
            self.nextNode = nextNode
        end
    end
end

class HashChaining
    #hàm băm
    def h(value)
        return value % M
    end
    
    #thêm giá trị vào bảng băm
    def add(value, heads)
        heads[h(value)].addAsc(value)
    end

    def addFromArr(a, heads)
        a.each{|i| add(i, heads)}
    end
    
    #xuất bảng băm
    def show(n, heads)
        for i in 0..n-1 do
            if (!heads[i].nil?)
                print "T[#{i}]-> "
            end
            heads[i].output()
        end
    end

    #tìm một giá trị trong bảng băm
    def search(heads, m)
        pos = h(m)
        if (heads[pos].search(m) == 0)
            return 0
        else
            return 1
        end
    end

    #xóa một giá trị trong bảng băm
    def del(heads, m)
        pos = h(m)
        t = heads[pos].deleteN(m)
    end
end

#main

hT = HashChaining.new
a = [11, 1, 12, 99, 21, 31, 39, 22, 45, 97, 188, 66, 33, 87, 81, 83, 36]
$input = false

#khởi tạo một mảng các dslk
for i in 0..M-1 do
    heads[i] = LinkedList.new
end

c = 1
while (c >= 1 && c <= 5)
    puts "\e[H\e[2J"
    print("---- BẢNG BĂM ----\n1. Khởi tạo bảng băm\n2. Xuất bảng băm\n3. Thêm phần tử vào bảng băm\n4. Tìm kiếm phần tử trong bảng băm\n5. Xóa phần tử trong bảng băm\n6. Thoát chương trình\n")
    print("Bạn chọn: ")
    c = gets.chomp.to_i

    case c
    when 1 #Khởi tạo bảng băm từ mảng có sẵn
        hT.addFromArr(a, heads)
        puts("Bảng băm đã được khởi tạo: ")
        hT.show(M, heads)
        $input = true
    when 2 # Xuất bảng băm
        if ($input == true)
            puts("Bảng băm đang lưu trữ: ")
            hT.show(M, heads)
        end
    when 3 #Thêm giá trị vào bảng băm
        if ($input == true)
            puts("Bảng băm đang lưu trữ: ")
            hT.show(M, heads)
            print("Nhập giá trị muốn thêm: ")
            x = gets.chomp.to_i
            if(hT.search(heads, x) == 0)
                hT.add(x, heads)
                print("Sau khi thêm #{x}:\n")
                hT.show(M, heads)
            else
                print("#{x} đã tồn tại trong bảng băm, không thể thêm")
            end
        end
    when 4 #Tìm kiếm giá trị trong bảng băm
        if ($input == true)
            puts("Bảng băm đang lưu trữ: ")
            hT.show(M, heads)
            print("Nhập giá trị muốn tìm: ")
            x = gets.chomp.to_i
            if(hT.search(heads, x) == 0)
                print("#{x} không tồn tại")
            else
                print("#{x} có tồn tại")
            end
            puts
        end
    when 5 #Xóa giá trị trong bảng băm
        if ($input == true)
            puts("Bảng băm đang lưu trữ: ")
            hT.show(M, heads)
            print("Nhập giá trị muốn xóa: ")
            x = gets.chomp.to_i
            hT.del(heads, x)
            print("Sau khi xóa #{x}:\n")
            hT.show(M, heads)
        end
    else
        puts "\nThoát"
    end

    if ($input == false && c >= 1 && c <= 5)
        puts "Vui lòng khởi tạo bảng băm trước khi thực hiện chức năng"
    end

    puts

    if (c >= 1 && c<= 5)
        puts "\nNhấn phím ENTER để tiếp tục"
        pause = $stdin.gets.chomp
    end
end