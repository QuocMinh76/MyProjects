class ArrayStimulator
    def init()
        @arr=[]
        @n=0
    end
    $i
    #Khởi tạo ngẫu nhiên
    def randomInit
        print("Mời bạn nhập số lượng phần tử: ")
        @n=gets.chomp.to_i
        for i in (0..@n-1) do
            @arr[i]=rand(10..100)
        end
        
    end
    
    #xuất
    def output
        for i in (0..@n-1) do
            print("#{@arr[i]}"+" ")
        end
        puts
    end

    def find(x)
        for i in 0..@n-1 do
            if (@arr[i] == x)
                return 1
            end
        end
        return 0
    end
    
    #thêm
    def addAt
        loop do
            print("Mời nhập vị trí muốn chèn: ")
            $i=gets.chomp.to_i
            if $i<0 || $i>@n
                puts("Vị trí không phù hợp")
            end
            break if $i>=0 && $i<=@n
        end    
        print("Mời nhập giá trị muốn chèn: ")
        val=gets.to_i
        @arr.insert($i,val)
        @n=@n+1
        
        print("Mảng sau khi thêm #{val} vào vị trí #{$i}: ")
        output()
    end
    
    #Xóa
    def delete
        $del_pos
        loop do
            print("Mời nhập vị trí muốn xóa: ")
            $del_pos=gets.chomp.to_i
            if $del_pos<0 || $del_pos>@n
                puts("Vị trí không hợp lệ ")
            end
            break if $del_pos>=0&&$del_pos<=@n
        end
        b=@arr.delete_at($del_pos)
        @n=@n-1
        
        print("Mảng sau khi xóa phần tử tại vị trí #{$del_pos}: ")
        output()
    end

    # 4 hàm sắp xếp mảng
    def selectionSort()
        for i in 0..@n-2 do
            min_pos = i
            for j in (i + 1)..@n-1 do
                if (@arr[j] < @arr[min_pos])
                    min_pos = j
                end
                temp = @arr[min_pos]
                @arr[min_pos] = @arr[i]
                @arr[i] = temp
            end
        end
    end

    def insertionSort()
        for i in 1..@n-1 do
            x = @arr[i]
            j = i - 1
            while (j >= 0 && @arr[j] > x)
                @arr[j + 1] = @arr[j]
                j -= 1
            end
            @arr[j + 1] = x
        end
    end

    def interchangeSort()
        for i in 0..@n-2 do
            for j in (i + 1)..@n-1 do
                if (@arr[i] > @arr[j])
                    temp = @arr[i]
                    @arr[i] = @arr[j]
                    @arr[j] = temp
                end
            end
        end
    end

    def bubbleSort()
        for i in 0..@n-2 do
            j = @n-1
            while(j > i)
                if (@arr[j-1] > @arr[j])
                    temp = @arr[j]
                    @arr[j] = @arr[j-1]
                    @arr[j-1] = temp
                end
                j -= 1
            end
        end
    end
    # kết thúc 4 hàm sắp xếp mảng
end

#main

a = ArrayStimulator.new
a.init()
$input = false

c = 1
while (c >= 1 && c <= 6)
    puts "\e[H\e[2J"
    print("---- DANH SÁCH ĐẶC ----\n1. Khởi tạo danh sách ngẫu nhiên\n2. Xuất danh sách\n3. Thêm phần tử tại vị trí i\n4. Tìm một giá trị trong mảng\n5. Xóa phần tử tại vị trí i\n6. Sắp xếp phần tử trong danh sách tăng dần\n7. Thoát chương trình\n")
    print("Bạn chọn: ")
    c = gets.chomp.to_i

    case c
    when 1 #Khởi tạo mảng ngẫu nhiên n phần tử từ 10 đến 100
        a.randomInit()
        $input = true
        print("Mảng được khởi tạo ngẫu nhiên: ")
        a.output()
    when 2 #Xuất mảng
        if ($input == true)
            print("Mảng đang lưu trữ: ")
            a.output()
        end
    when 3 #Thêm một phần tử
        if ($input == true)
            print("Mảng ban đầu: ")
            a.output()
            a.addAt()
        end
    when 4 #Tìm giá trị
        if ($input == true)
            print("Mảng đang lưu trữ: ")
            a.output()
            print("Nhập giá trị muốn tìm: ")
            x = gets.chomp.to_i
            if (a.find(x) == 1)
                print("#{x} có tồn tại trong mảng")
            else
                print("#{x} không tồn tại trong mảng")
            end
        end
    when 5 #Xóa phần tử
        if ($input == true)
            print("Mảng ban đầu: ")
            a.output()
            a.delete()
        end
    when 6 #Sắp xếp mảng
        if ($input == true)
            print("Mảng ban đầu: ")
            a.output()
            #a.selectionSort()
            #a.insertionSort()
            #a.interchangeSort()
            a.bubbleSort()
            print("Mảng sau khi sắp xếp: ")
            a.output()
        end
    else
        puts "\nThoát"
    end

    if ($input == false && c >= 1 && c <= 5)
        puts "Vui lòng khởi tạo danh sách trước khi thực hiện chức năng"
    end

    puts

    if (c >= 1 && c<= 6)
        puts "\nNhấn phím ENTER để tiếp tục"
        pause = $stdin.gets.chomp
    end
end