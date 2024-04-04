class NewsModel {
  final String imageUrl;
  final String title;
  final String text;
  final String date;

  NewsModel({
    required this.imageUrl,
    required this.title,
    required this.text,
    required this.date,
  });
}

final news = [
  NewsModel(
      date: 'today',
      imageUrl:
          'https://www.investopedia.com/thmb/17VMxpRyNHa64BAKOI219PKaFLk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/car-dealer-showing-new-car-6938e02d5076488e91d38edb72054770.jpeg',
      title:
          'New car rental service offers a wide range of premium-class vehicles at affordable prices',
      text:
          'In a recent announcement shaking up the car rental industry, a new player has entered the market with an enticing proposition - a diverse selection of premium-class vehicles available at prices that won\'t break the bank. This new car rental service aims to redefine luxury travel by making high-end cars accessible to a broader audience.With a focus on providing top-tier vehicles typically reserved for the elite, this service sets itself apart by ensuring that luxury is not synonymous with unattainable prices. Customers can now experience the thrill of driving prestigious brands and models without the hefty price tags usually associated with such exclusivity.From luxury sedans to high-performance sports cars, the fleet of vehicles offered caters to discerning individuals looking to elevate their driving experience. The affordability of these premium-class cars opens up a world of possibilities for customers who wish to indulge in luxury without compromise.This new car rental service is poised to revolutionize the way people perceive and access premium vehicles, setting a new standard for luxury car rentals that combines opulence with affordability. Customers can now enjoy the sophistication and prestige of driving a premium-class car without the exorbitant costs, ushering in a new era of accessible luxury transportation.'),
  NewsModel(
      imageUrl:
          'https://pictures.dealer.com/e/earthmotorcars/0030/73279a6d00cbb37249ac4487f5115cb2x.jpg',
      title:
          'Car dealer launches a car exchange program with an additional payment for a new vehicle.',
      text:
          'In a bold move to attract customers and stimulate sales, a prominent car dealer has rolled out a new car exchange program that offers a unique incentive - an additional payment towards a new vehicle when trading in an old one. This innovative initiative aims to make upgrading to a newer model more enticing and financially beneficial for car owners.The program allows customers to trade in their current vehicles and receive not only a fair market value for their used cars but also an extra bonus that can be put towards the purchase of a brand new vehicle from the dealership. This additional payment serves as a lucrative incentive for customers looking to refresh their rides without feeling the full financial burden of a new purchase.By launching this car exchange program, the dealer seeks to not only boost sales but also foster customer loyalty by providing a seamless and attractive option for customers to upgrade their vehicles. This initiative aligns with the dealer\'s commitment to offering innovative solutions that cater to the needs and preferences of their clientele.With the introduction of this program, car owners have an exceptional opportunity to make the transition to a new vehicle smoother and more cost-effective. This forward-thinking approach from the car dealer is poised to set a new standard in the automotive industry, potentially reshaping the way car exchanges are conducted and enhancing the overall customer experience in the process.',
      date: '22 march'),
  NewsModel(
      imageUrl:
          'https://images.dealersync.com/cloud/userdocumentprod/2772/images/home/ds-inventory-banner.jpg?width=767',
      title: 'Popular car rental company offers discounts on weekend bookings.',
      text:
          'In a move sure to delight weekend travelers and road trip enthusiasts, a well-known car rental company has unveiled an exciting promotion offering significant discounts on weekend bookings. This special offer caters to customers looking to explore new horizons, visit friends and family, or simply enjoy a leisurely getaway without breaking the bank.Under this promotion, customers can take advantage of slashed rates and exclusive deals when renting a car for weekend journeys. Whether it\'s a compact car for a short city break or a spacious SUV for a countryside adventure, the discounted rates make renting a vehicle for weekend escapades more affordable and accessible to a wider audience.By introducing this promotion, the car rental company aims to not only attract new customers but also reward loyal patrons with cost-effective options for weekend travel. This initiative showcases the company\'s commitment to providing value-driven solutions that enhance the overall rental experience and make weekend getaways more appealing to travelers of all kinds.With these discounted rates on weekend bookings, customers now have the opportunity to embark on memorable trips, spontaneous excursions, or well-planned adventures at a fraction of the usual cost. This promotion is set to redefine weekend travel, making it easier and more affordable for individuals and families to hit the road and create lasting memories without overspending.',
      date: '10 january'),
  NewsModel(
      imageUrl:
          'https://www.performancesuretybonds.com/blog/wp-content/uploads/2021/10/autodealer.jpg',
      title: 'Car enthusiasts club launches a platform for selling used cars.',
      text:
          'In a move that is set to revolutionize the way car enthusiasts buy and sell used vehicles, a dedicated car enthusiasts club has introduced a new platform specifically designed for trading pre-owned cars. This innovative online marketplace caters to the needs of automotive aficionados looking to buy or sell vehicles within a community of like-minded individuals.The platform offers a tailored experience for users, providing a space where enthusiasts can browse through a curated selection of used cars that resonate with their passion for automobiles. Whether it\'s classic cars, sports cars, or rare collectibles, this platform aims to connect buyers and sellers who share a common love for all things automotive.By launching this specialized platform, the car enthusiasts club seeks to create a vibrant marketplace where members can interact, trade, and share their passion for cars in a seamless digital environment. Through features like detailed listings, user reviews, and insider insights, the platform enables buyers to make informed decisions and sellers to reach a targeted audience of enthusiasts.This initiative not only enhances the trading experience for car lovers but also fosters a sense of community and camaraderie among members of the club. It provides a safe and reliable space for individuals to buy and sell used cars, knowing that they are interacting with fellow enthusiasts who share their enthusiasm for automotive culture.With the introduction of this dedicated platform for selling used cars, the car enthusiasts club is taking a bold step towards creating a dynamic marketplace that caters to the unique needs and interests of its members. This innovative initiative is poised to reshape the way car enthusiasts engage in buying and selling used vehicles, offering a one-of-a-kind platform where passion meets practicality in the world of automotive trading.',
      date: '28 february'),
  NewsModel(
      imageUrl:
          'https://autoimage.capitalone.com/cms/Auto/assets/images/2869-hero-what-happens-when-a-car-dealership-runs-a-credit-check.jpg',
      title: 'Global Company Announces Strategic Merger with Industry Leader',
      text:
          'One of the largest global companies has announced the signing of a strategic merger agreement with one of the leading industry leaders. This move has become a key event in the business world and has caused widespread resonance in the business community.The merger of two strong market players promises to bring synergistic effects and create a new powerful entity capable of shaping market conditions and setting new standards of quality and service."We are convinced that this strategic combination will significantly increase our competitiveness and expand the geographic scope of our influence. We are ready for this new stage and confident that our joint efforts will yield extraordinary results," commented a company representative.Analysts note that such mergers not only strengthen companies\' positions in the market but also contribute to the overall development of the industry and may lead to the emergence of new innovations and technologies. The merger of a global company with an industry leader is intended to change the business landscape and influence development trends in the future.',
      date: '29 march'),
  NewsModel(
      date: '17 march',
      imageUrl:
          'https://peakbusinessvaluation.com/wp-content/uploads/Car-dealership-1-scaled.jpeg',
      title:
          'Startup offers a unique service of renting electric vehicles with charging stations everywhere.',
      text:
          'In a groundbreaking development in the realm of sustainable transportation, a pioneering startup has introduced a revolutionary service that offers the rental of electric vehicles equipped with charging stations distributed strategically across various locations. This innovative initiative aims to address the growing demand for eco-friendly mobility solutions while overcoming the common challenges associated with electric vehicle adoption.Through this unique service, customers can easily rent electric vehicles for short-term use, whether it\'s for daily commutes, weekend getaways, or longer trips, knowing that a network of charging stations is readily available to support their journey. By combining the convenience of on-demand vehicle rental with the accessibility of widespread charging infrastructure, the startup seeks to make electric mobility more convenient and appealing to a broader audience.The widespread deployment of charging stations ensures that renters have the peace of mind knowing they can recharge their electric vehicles quickly and efficiently, eliminating range anxiety and enabling seamless travel experiences. This integrated approach not only promotes the adoption of electric vehicles but also paves the way for a more sustainable and environmentally conscious mode of transportation.By offering this innovative service of renting electric vehicles with ubiquitous charging stations, the startup is at the forefront of driving the shift towards greener and cleaner mobility solutions. This forward-thinking initiative aligns with the global push towards reducing carbon emissions and fostering a more sustainable transportation ecosystem, positioning the startup as a trailblazer in the transition towards a cleaner and more eco-conscious future.'),
];
