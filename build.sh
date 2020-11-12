# docker build -t bag2video .

function run () {
  docker run -it --rm -v /home/ubuntu/share:/home/autoware/share bag2video \
    bash -c '. /home/autoware/Autoware/install/setup.bash && bag2video.py'
}
