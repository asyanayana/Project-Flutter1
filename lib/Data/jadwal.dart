class Jadwal {
  String image;
  String image2;
  String date;
  String time;

  Jadwal({
    required this.image,
    required this.image2,
    required this.date,
    required this.time,
  });
}

List<Jadwal> jadwal = [
  Jadwal(
    image: "assets/image/13.png",
    image2: "assets/image/14.jpg",
    date: "29 juli 2022",
    time: "16.00 WIB",
  ),
  Jadwal(
    image: "assets/image/15.jpg",
    image2: "assets/image/16.jpg",
    date: "29 juli 2022",
    time: "20.30 WIB",
  ),
  Jadwal(
    image: "assets/image/17.png",
    image2: "assets/image/18.png",
    date: "30 juli 2022",
    time: "16.00 WIB",
  ),
  Jadwal(
    image: "assets/image/19.png",
    image2: "assets/image/20.jpg",
    date: "30 juli 2022",
    time: "20.30 WIB",
  ),
];