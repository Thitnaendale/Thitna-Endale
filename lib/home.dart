import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBalances = false;

  final String _mainBalance = 'ETB 4,320.00';
  final String _rewardBalance = 'ETB 120.00';
  final String _earnedBalance = 'ETB 45.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: small label and notifications
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'am',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_outlined,
                            size: 28,
                          ),
                          color: Colors.black,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        Positioned(
                          right: 2,
                          top: 2,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: const Text(
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                const Text(
                  'Good morning Aster 👋',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Have a great day!',
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 18),

                // Full-width red balance card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top row: label, eye toggle and Add Money button
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Balance',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                setState(() => _showBalances = !_showBalances),
                            icon: Icon(
                              _showBalances
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.add, color: Colors.white, size: 16),
                                SizedBox(width: 6),
                                Text(
                                  'Add Money',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Main balance (hidden or visible)
                      Text(
                        _showBalances ? _mainBalance : '••••••',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          letterSpacing: 6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Reward and Earned balances row
                      Row(
                        children: [
                          // Reward balance (left)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Reward Balance',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  _showBalances ? _rewardBalance : '••••••',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 4,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Earned balance (right)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Earned Balance',
                                style: TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                _showBalances ? _earnedBalance : '••••••',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // Actions: first row (merchant payment, bill payment, credit & saving)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ActionItem(
                      icon: Icons.store,
                      label: 'Merchant',
                      color: Colors.red,
                    ),
                    _ActionItem(
                      icon: Icons.receipt_long,
                      label: 'Bill',
                      color: Colors.red,
                    ),
                    _ActionItem(
                      icon: Icons.savings,
                      label: 'Credit & Save',
                      color: Colors.red,
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Actions: second row (transfer, airtime/package, other)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Use same icon as transaction swap to resemble telebirr style
                    _ActionItem(
                      icon: Icons.swap_horiz,
                      label: 'Transfer',
                      color: Colors.red,
                    ),
                    _ActionItem(
                      icon: Icons.local_phone,
                      label: 'Airtime',
                      color: Colors.red,
                    ),
                    _ActionItem(
                      icon: Icons.more_horiz,
                      label: 'Other',
                      color: Colors.red,
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Transactions header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Transactions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox.shrink(),
                  ],
                ),

                const SizedBox(height: 8),

                // Mock transaction list (shrinkWrap so outer scroll handles scrolling)
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    _TransactionItem(
                      title: 'CBE Payment',
                      subtitle: 'Payment to CBE - 2026-09-01',
                      amount: '-ETB 500.00',
                      icon: Icons.account_balance,
                    ),
                    _TransactionItem(
                      title: 'M-PESA Received',
                      subtitle: 'From +2517xxxxxxx - 2026-08-30',
                      amount: '+ETB 1,200.00',
                      icon: Icons.swap_horiz,
                    ),
                    _TransactionItem(
                      title: 'CBE Deposit',
                      subtitle: 'Salary - 2026-08-28',
                      amount: '+ETB 3,000.00',
                      icon: Icons.account_balance,
                    ),
                    _TransactionItem(
                      title: 'M-PESA Payment',
                      subtitle: 'Payment to store - 2026-08-25',
                      amount: '-ETB 120.00',
                      icon: Icons.swap_horiz,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _ActionItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Icon(icon, color: color, size: 28)),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final IconData icon;
  const _TransactionItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    this.icon = Icons.swap_horiz,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      leading: CircleAvatar(
        backgroundColor: Colors.red.withOpacity(0.12),
        child: Icon(icon, color: Colors.red),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: Text(
        amount,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
