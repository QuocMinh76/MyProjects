class LinkedList
    class Node
        attr_accessor :next
        attr_reader   :value
      
        def initialize(value)
          @value = value
          @next  = nil
        end
    end

    def initialize
      @head = nil
    end

    def initList(a, n)
      for i in 0..n-1 do
        append(a[i])
      end
    end
  
    def append(value)
      if @head
        find_tail.next = Node.new(value)
      else
        @head = Node.new(value)
      end
    end
  
    def find_tail
      node = @head
  
      return node if !node.next
      return node if !node.next while (node = node.next)
    end
  
  
    def find(value)
      node = @head
  
      return false if !node.next
      return node  if node.value == value
  
      while (node = node.next)
        return node if node.value == value
      end
    end
  
    def delete(value)
        if @head.value == value
            @head = @head.next
            return
          end
      
          node = find_before(value)
          node.next = node.next.next
    end
  
    def find_before(value)
      node = @head
  
      return false if !node.next
      return node  if node.next.value == value
  
      while (node = node.next)
        return node if node.next && node.next.value == value
      end
    end
  
    def printOut
      node = @head
      print("#{node.value} ") 
  
      while (node = node.next)
        print("#{node.value} ") 
      end
      puts
    end
end
  
#main
  
#Khởi tạo danh sách liên kết
list = LinkedList.new
test = [19, 10, 34, 65, 17, 88, 50, 49, 4, 99]
n = 10
$input = false

c = 1
while (c >= 1 && c <= 5)
    puts "\e[H\e[2J"
    print("---- DANH SÁCH LIÊN KẾT ----\n1. Khởi tạo danh sách liên kết\n2. Xuất danh sách\n3. Thêm phần tử vào danh sách\n4. Tìm kiếm phần tử trong danh sách\n5. Xóa phần tử trong danh sách\n6. Thoát chương trình\n")
    print("Bạn chọn: ")
    c = gets.chomp.to_i

    case c
    when 1 #Khởi tạo dslk
      list.initList(test, n)
      print("Danh sách liên kết đã được khởi tạo: ")
      list.printOut
      $input = true
    when 2 #Xuất ds
      if ($input == true)
        print("Danh sách liên kết đang lưu trữ: ")
        list.printOut
      end
    when 3 #Thêm
      if ($input == true)
        print("Danh sách liên kết ban đầu: ")
        list.printOut
        print("Nhập giá trị muốn thêm: ")
        x = gets.chomp.to_i
        list.append(x)
        print("Danh sách liên kết sau khi thêm #{x}: ")
        list.printOut
      end
    when 4 #Tìm kiếm phần tử trong ds
      if ($input == true)
        print("Danh sách liên kết đang lưu trữ: ")
        list.printOut
        print("Nhập giá trị muốn tìm: ")
        x = gets.chomp.to_i
        if (!list.find(x).nil?)
            puts "#{x} có tồn tại trong danh sách"
        else
            puts "#{x} không tồn tại trong danh sách"
        end
      end
    when 5 #Xóa
      if ($input == true)
        print("Danh sách liên kết ban đầu: ")
        list.printOut
        print("Nhập giá trị muốn xóa: ")
        x = gets.chomp.to_i
        if (!list.find(x).nil?)
            list.delete(x)
            print("Danh sách liên kết sau khi xóa #{x}: ")
            list.printOut
        else
            puts "#{x} không tồn tại trong danh sách, không thể xóa"
        end
      end
    else
        puts "\nThoát"
    end

    if ($input == false && c >= 1 && c <= 5)
      puts "Vui lòng khởi tạo danh sách trước khi thực hiện chức năng"
    end

    puts

    if (c >= 1 && c<= 5)
      puts "\nNhấn phím ENTER để tiếp tục"
      pause = $stdin.gets.chomp
    end
end