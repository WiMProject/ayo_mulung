import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage>
    with SingleTickerProviderStateMixin {
  int userPoints = 100;

  final List<Map<String, dynamic>> rewards = [
    {
      'title': 'Voucher 20K',
      'points': 50,
      'image': 'https://cdn-icons-png.flaticon.com/512/991/991952.png',
    },
    {
      'title': 'Reusable Bag',
      'points': 30,
      'image': 'https://cdn-icons-png.flaticon.com/512/2917/2917992.png',
    },
    {
      'title': 'Tumbler',
      'points': 70,
      'image': 'https://cdn-icons-png.flaticon.com/512/1680/1680325.png',
    },
    {
      'title': 'Eco Straw',
      'points': 40,
      'image': 'https://cdn-icons-png.flaticon.com/512/1430/1430453.png',
    },
  ];

  late AnimationController _controller;
  late Animation<double> _buttonAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _buttonAnim = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void redeemReward(int cost, String title) {
    if (userPoints >= cost) {
      setState(() {
        userPoints -= cost;
      });
      _controller.forward(from: 0);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil menukarkan $title!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Poin Anda tidak mencukupi!'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Widget _buildRewardCard(int index) {
    final reward = rewards[index];
    final canRedeem = userPoints >= reward['points'];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      shadowColor: canRedeem ? Colors.green.shade100 : Colors.grey.shade300,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'rewardImage$index',
              child: Image.network(
                reward['image'],
                height: 80,
                fit: BoxFit.contain,
                color: canRedeem ? null : Colors.grey,
                colorBlendMode: canRedeem ? null : BlendMode.saturation,
              ),
            ),
            SizedBox(height: 12),
            Text(
              reward['title'],
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: canRedeem ? Colors.black : Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${reward['points']} Poin',
              style: TextStyle(
                fontSize: 15,
                color: canRedeem ? Colors.green[700] : Colors.grey,
              ),
            ),
            SizedBox(height: 12),
            FadeTransition(
              opacity: _buttonAnim,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: canRedeem ? Colors.green : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed:
                    canRedeem
                        ? () => redeemReward(reward['points'], reward['title'])
                        : null,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text('Tukar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tukar Poin'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Poin Anda: $userPoints',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: rewards.length,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) => _buildRewardCard(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
