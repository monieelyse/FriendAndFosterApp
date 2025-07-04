import 'package:flutter/material.dart';
import '../models/dog.dart';

class RentForm extends StatefulWidget {
  final Dog dog;
  const RentForm({super.key, required this.dog});

  @override
  _RentFormState createState() => _RentFormState();
}

class _RentFormState extends State<RentForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPreset;
  int? _otherValue;
  String _otherUnit = 'minutes';

  static const Map<String, String> presets = {
    '30 minutes': '30m',
    '1 hour': '1h',
    '3 hours': '3h',
    '1 day': '1d',
    '3 days': '3d',
    'Other': 'other',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Rent ${widget.dog.name}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),

                // Preset options
                ...presets.keys.map((label) {
                  return RadioListTile<String>(
                    title: Text(label),
                    value: label,
                    groupValue: _selectedPreset,
                    onChanged: (val) {
                      setState(() {
                        _selectedPreset = val;
                        if (val != 'Other') _otherValue = null;
                      });
                    },
                  );
                }),

                // "Other" input
                if (_selectedPreset == 'Other') ...[
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                            hintText: 'e.g. 45',
                          ),
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Enter a number';
                            }
                            final n = int.tryParse(val);
                            if (n == null || n <= 0) {
                              return 'Invalid number';
                            }
                            return null;
                          },
                          onSaved: (val) {
                            _otherValue = int.tryParse(val!);
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: DropdownButtonFormField<String>(
                          value: _otherUnit,
                          items: const [
                            DropdownMenuItem(value: 'minutes', child: Text('Minutes')),
                            DropdownMenuItem(value: 'hours', child: Text('Hours')),
                            DropdownMenuItem(value: 'days', child: Text('Days')),
                          ],
                          onChanged: (val) {
                            if (val != null) setState(() => _otherUnit = val);
                          },
                          decoration: const InputDecoration(labelText: 'Unit'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],

                // Submit button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _selectedPreset != null) {
                      _formKey.currentState!.save();
                      final duration = _selectedPreset != 'Other'
                          ? presets[_selectedPreset]!
                          : '$_otherValue $_otherUnit';
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Requested $duration for ${widget.dog.name}!')),
                      );
                    }
                  },
                  child: const Text('Submit Request'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
