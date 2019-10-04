class Image

  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |n|
      puts n.join
    end
  end

  def blur!(distance=1)
    distance.times do
      blur_loc!
    end
  end

  private

    def blur_loc!
      blur_loc = []
      @image.each_with_index do |n, i|
        n.each_with_index do |x, n_i|
          blur_loc << [i, n_i] if x == 1
        end
      end

      blur_loc.each do |locs|
        @image[locs[0]][locs[1] + 1] = 1 if locs[1] + 1 <= @image[locs[0]].length - 1
        @image[locs[0]][locs[1] - 1] = 1 if locs[1] - 1 >= 0
        @image[locs[0] + 1][locs[1]] = 1 if locs[0] + 1 <= @image.length - 1
        @image[locs[0] - 1][locs[1]] = 1 if locs[0] - 1 >= 0
      end
    end

end

image = Image.new([
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
])
image.blur!(2)
image.output_image