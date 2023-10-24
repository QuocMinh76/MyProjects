class Node
    attr_accessor :data,:left,:right
    def initialize data
        @data=data
        @left=@right=nil
    end
end

class BinarySearchTree
    attr_accessor :root

    def init()
        root = nil
    end

    def addFromArr(arr, n)
        i = 0
        while i < n
            if (i == 0)
                self.root = insert(root, arr[i])
            else
                insert(root, arr[i])
            end
            i += 1
        end
    end
    
    def insert(root, x)
        if root == nil 
            return Node.new(x)
        else
            if root.data == x
                return
            elsif root.data < x
                root.right = insert(root.right, x)
            else
                root.left = insert(root.left, x)
            end
        end
        return root
    end
    
    def LNR(root)
        if root == nil
            return
        end
        LNR(root.left)
        print ("#{root.data} ")
        LNR(root.right)
    end
    
    def search(root, x, a)
        if root == nil
            return
        end
        if (root.data == x)
            a[0] = 1
            return
        end
        search(root.left, x, a)
        search(root.right, x, a)
    end

    def delete(value, root)
      if root.nil?
        return
      elsif value > root.data
        root.right = delete(value, root.right)
      elsif value < root.data
        root.left = delete(value, root.left)
      else # i.e. value == root.value
        if root.left.nil?  # bao gồm luôn cả trường hợp cả 2 node con đều nil
          root = root.right
        elsif root.right.nil?
          root = root.left
        else
          root = shift_values(root)
        end
      end
      root
    end

 # 3 phương thức hỗ trợ cho phương thức delete
  def shift_values(root)
    root.data = get_next_value(root.right)
    root.right = right_subtree_without_next_value(root.right)
    root
  end

  def get_next_value(root)
    if root.left.nil?
      root.data
    else
      get_next_value(root.left)
    end
  end

  def right_subtree_without_next_value(root)
    if root.left.nil?
      return root.right
    else
      root.left = right_subtree_without_next_value(root.left)
    end
    root
  end
 # kết thúc 3 phương thức hỗ trợ cho phương thức delete
end

#main
test = [50, 25, 60, 55, 90, 37, 15, 6, 18, 10, 58]
n = 11
bt = BinarySearchTree.new
bt.init()
$input = false

c = 1
while (c >= 1 && c <= 5)
    puts "\e[H\e[2J"
    print("---- CÂY NHỊ PHÂN TÌM KIẾMKIẾM ----\n1. Khởi tạo cây nhị phân tìm kiếm\n2. Xuất cây NP\n3. Thêm phần tử vào cây NP\n4. Tìm kiếm phần tử trong cây NP\n5. Xóa phần tử trong cây NP\n6. Thoát chương trình\n")
    print("Bạn chọn: ")
    c = gets.chomp.to_i

    case c
    when 1 #Khởi tạo cây nhị phân từ mảng có sẵn
      bt.addFromArr(test, n)
      print("Cây nhị phân đã được khởi tạo: ")
      bt.LNR(bt.root)
      $input = true
      puts
    when 2 # Xuất cây nhị phân theo LNR
      if ($input == true)
        print("Cây nhị phân đang lưu trữ (xuất theo LNR): ")
        bt.LNR(bt.root)
        puts
      end
    when 3 #Thêm giá trị vào cây nhị phân
      if ($input == true)
        print("Cây nhị phân đang lưu trữ: ")
        bt.LNR(bt.root)
        print("\nNhập giá trị muốn thêm: ")
        x = gets.chomp.to_i
        bt.insert(bt.root, x)
        print("Cây nhị phân sau khi thêm #{x}: ")
        bt.LNR(bt.root)
        puts
      end
    when 4 #Tìm kiếm giá trị trong cây nhị phân
      if ($input == true)
        print("Cây nhị phân đang lưu trữ: ")
        bt.LNR(bt.root)
        print("\nNhập giá trị muốn tìm: ")
        x = gets.chomp.to_i
        a = Array.new(1)
        bt.search(bt.root, x, a)
        if (a[0] == 1)
            print("#{x} có tồn tại trong cây nhị phân")
        else
            print("#{x} không tồn tại trong cây nhị phân")
        end
        puts
      end
    when 5 #Xóa giá trị trong cây nhị phân
      if ($input == true)
        print("Cây nhị phân đang lưu trữ: ")
        bt.LNR(bt.root)
        print("\nNhập giá trị muốn xóa: ")
        x = gets.chomp.to_i
        bt.delete(x, bt.root)
        print("Cây nhị phân sau khi xóa #{x}: ")
        bt.LNR(bt.root)
        puts
      end
    else
        puts "\nThoát"
    end

    if ($input == false && c >= 1 && c <= 5)
      puts "Vui lòng khởi tạo cây NP trước khi thực hiện chức năng"
    end

    puts

    if (c >= 1 && c<= 5)
      puts "\nNhấn phím ENTER để tiếp tục"
      pause = $stdin.gets.chomp
    end
end