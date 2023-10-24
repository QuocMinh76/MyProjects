
class Stack
  attr_accessor :items

  def initialize
    @items = []
  end

  def push(item)
    @items.push(item)
  end

  def pop
    @items.pop
  end

  def size
    @items.length
  end
end

# 3 hàm nhập xuất với stack
def inputManual(stack)
  x = 1
  until x == 0
    print("Nhập giá trị muốn thêm vào stack (Nhập 0 để dừng thêm): ")
    x = gets.chomp.to_i
    if (x != 0)
      stack.push(x)
    end
  end
end

def inputFromArr(stack, a)
  n = a.size
  for i in 0..n-1 do
    stack.push(a[i])
  end
end

def output(stack)
  print("\nCác giá trị trong stack sau khi lấy ra: ")
  n = stack.size
  for i in 0..n-1 do
    if (i == n-1)
      print("#{stack.pop}")
    else
      print("#{stack.pop}, ") 
    end
  end
end
# kết thúc 3 hàm nhập xuất với stack

#main

stack1 = Stack.new
stack2 = Stack.new
test = ["food", "water", "tools", "clothes", "items"]

c = 1
while (c >= 1 && c <= 2)
    puts "\e[H\e[2J"
    print("---- STACK ----\n1. Tạo stack từ mảng\n2. Tạo stack bằng tay\n3. Thoát chương trình\n")
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
      inputFromArr(stack1, test) 
      output(stack1)
    when 2 #input bằng tay
      inputManual(stack2) 
      output(stack2)
      puts
    else
        puts "\nThoát"
    end

    if ($input == false && c >= 1 && c <= 2)
        puts "Vui lòng khởi tạo stack trước khi thực hiện chức năng"
    end

    puts

    if (c >= 1 && c<= 2)
      puts "\nNhấn phím ENTER để tiếp tục"
      pause = $stdin.gets.chomp
    end
end

stack1
stack2