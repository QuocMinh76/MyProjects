
class Queue
    attr_accessor :items
  
    def initialize
      @items = []
    end
  
    def enqueue(item)
      @items.unshift(item)
    end
  
    def dequeue
      @items.pop
    end
  
    def size
      @items.length
    end
end

# 3 hàm nhập xuất với queue
def inputManual(queue)
    x = 1
    until x == 0
      print("Nhập giá trị muốn thêm vào queue (Nhập 0 để dừng thêm): ")
      x = gets.chomp.to_i
      if (x != 0)
        queue.enqueue(x)
      end
    end
end
  
def inputFromArr(queue, a)
    n = a.size
    for i in 0..n-1 do
      queue.enqueue(a[i])
    end
end
  
def output(queue)
    print("\nCác giá trị trong queue sau khi lấy ra: ")
    n = queue.size
    for i in 0..n-1 do
      if (i == n-1)
        print("#{queue.dequeue}")
      else
        print("#{queue.dequeue}, ") 
      end
    end
end

# kết thúc 3 hàm nhập xuất với queue

#main

queue1 = Queue.new
queue2 = Queue.new
test = ["relationships", "money", "health", "power", "desire"]

c = 1
while (c >= 1 && c <= 2)
    puts "\e[H\e[2J"
    print("---- STACK ----\n1. Tạo queue từ mảng\n2. Tạo queue bằng tay\n3. Thoát chương trình\n")
    print("Bạn chọn: ")
    c = gets.chomp.to_i

    case c
    when 1 #input bằng mảng có sẵn
      print("Mảng ban đầu: ")
      for i in test do
        if i == test.last
          print("#{i}")
        else
          print("#{i}, ")
        end
      end
      inputFromArr(queue1, test)
      output(queue1)
      puts
    when 2 #input bằng tay
      inputManual(queue2) 
      output(queue2)
      puts
    else
        puts "\nThoát"
    end

    if ($input == false && c >= 1 && c <= 2)
        puts "Vui lòng khởi tạo queue trước khi thực hiện chức năng"
    end

    puts

    if (c >= 1 && c<= 2)
      puts "\nNhấn phím ENTER để tiếp tục"
      pause = $stdin.gets.chomp
    end
end

queue1
queue2