# docker build -t bag2video .

function run () {
  INDEX=$1
  cd /home/ubuntu/share/

  echo "rosbag($(($INDEX - 2))).tar.gz -> $INDEX.bag"
  tar xf "rosbag($(($INDEX - 2))).tar.gz"
  mv *.bag $INDEX.bag
  # tar xf 'rosbag(0).tar.gz' -O $(tar tf 'rosbag(0).tar.gz' | grep '\.bag') > 0.bag

  echo "$INDEX.bag -> $INDEX.avi"
  docker run -it --rm -v /home/ubuntu/share:/home/autoware/share bag2video \
    bash -c ". /home/autoware/Autoware/install/setup.bash && bag2video.py /front_camera/image/compressed /home/autoware/share/$INDEX.bag --outfile /home/autoware/share/$INDEX.avi"

  echo "$INDEX.avi -> $INDEX.mp4"
  ffmpeg -i $INDEX.avi -r 30 $INDEX.mp4

  rm $INDEX.bag
}

run 2
