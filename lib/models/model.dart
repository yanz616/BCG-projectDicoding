class ItemData {
  String image;
  String name;
  String word;
  String jobDesk;
  String desk;
  Company company;

  ItemData({
    required this.image,
    required this.name,
    required this.word,
    required this.jobDesk,
    required this.desk,
    required this.company,
  });
}

class Company {
  String img;
  String detail;
  Company({
    required this.img,
    required this.detail,
  });
}

class MyData {
  static var data = [
    ItemData(
      image: 'assets/images/co.png',
      name: 'Dr. Hamdi Sopian Hadi,M.E',
      word: 'Let Me Help Your Bussiness uhsabdbJVCsagdyaudgetftvcatydyafdrqfg',
      jobDesk: 'CEO Bussines Consultation Group',
      desk: '',
      company: Company(
        img: "assets/images/BCG-example.jpg",
        detail: '',
      ),
    ),
    ItemData(
      image: 'assets/images/image-2.png',
      name: 'Lidia,M.Kom',
      word: 'Let Me Help Your Bussiness',
      jobDesk: 'Design departement Manager',
      desk: '',
      company: Company(
        img: 'assets/images/BCG-example.jpg',
        detail: '',
      ),
    ),
    ItemData(
      image: 'assets/images/image-5.png',
      name: 'Nurrajaby,M.T',
      word: 'Let Me Help Your Bussiness',
      jobDesk: 'Programmer Section Manager',
      desk: '',
      company: Company(
        img: 'assets/images/BCG-example.jpg',
        detail: '',
      ),
    ),
  ];
  static var data_2 = [
    ItemData(
      image: 'assets/images/co.png',
      name: 'Dr.Hamdi Sopian Hadi ,M.E',
      word: 'Let Me Help Your Bussiness',
      jobDesk: 'CEO Bussines Consultation Group',
      desk:
          '''Hello, I'm Hamdi Sopian, CEO of Business Consultation Group,I want to help you find business ideas from the knowledge I have learned.''',
      company: Company(
        img: 'assets/images/BCG-example.jpg',
        detail: '''
a company that operates in the business sector with the aim of helping business people find new ideas about business''',
      ),
    ),
    ItemData(
      image: 'assets/images/image-2.png',
      name: 'Layla,M.Kom',
      word: 'Let Me Help Your Bussiness',
      jobDesk: 'Design departement Manager',
      desk:
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum''',
      company: Company(
        img: 'assets/images/BCG-example.jpg',
        detail: '''
a company that operates in the business sector with the aim of helping business people find new ideas about business''',
      ),
    ),
    ItemData(
      image: 'assets/images/image-1.png',
      name: 'Nurrajaby,M.T',
      word: 'Let Me Help Your Bussiness',
      jobDesk: 'Programmer Section Manager',
      desk:
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum''',
      company: Company(
        img: 'assets/images/BCG-example.jpg',
        detail: '''
a company that operates in the business sector with the aim of helping business people find new ideas about business''',
      ),
    ),
    ItemData(
      image: 'assets/images/image-4.png',
      name: 'Raiden Miya,M.E',
      word: 'Let Me Help Your Bussiness',
      jobDesk: 'Owner Game Store',
      desk:
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum''',
      company: Company(
        img: 'assets/images/BCG-example.jpg',
        detail: '''
a company that operates in the business sector with the aim of helping business people find new ideas about business''',
      ),
    ),
    ItemData(
      image: 'assets/images/image-3.png',
      name: 'Nanda,S.Kom',
      word: 'Let Me Help Your Bussiness',
      jobDesk: 'Owner Coffe shop',
      desk:
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum''',
      company: Company(
        img: 'assets/images/BCG-example.jpg',
        detail: '''
a company that operates in the business sector with the aim of helping business people find new ideas about business''',
      ),
    ),
    ItemData(
      image: 'assets/images/image-5.png',
      name: 'Ardian,M.T',
      word: 'Let Me Help Your Bussiness',
      jobDesk: 'Leader Debate Organization',
      desk: '',
      company: Company(
        img: 'assets/images/BCG-example.jpg',
        detail: '',
      ),
    ),
  ];
}
