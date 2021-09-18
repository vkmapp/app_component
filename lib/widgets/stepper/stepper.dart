import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({Key? key}) : super(key: key);

  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int currentStep = 0;
  bool isCompleted = false;

  ///Step 1: getSteps
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          title: const Text('New Register'),
          subtitle: const Text('Register subtitle'),
          content: const SizedBox(
            height: 400,
            child: Center(
              child: Text('Step 1 Page'),
            ),
          ),
          isActive: currentStep >= 0,
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          title: const Text('Step 2 Form'),
          subtitle: const Text('Register subtitle'),
          content: const Center(
            child: Text('Step 2 Page'),
          ),
          isActive: currentStep >= 1,
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          title: const Text('Step 3 Form'),
          subtitle: const Text('Register subtitle'),
          content: const Center(
            child: Text('Step 3 Page'),
          ),
          isActive: currentStep >= 2,
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          title: const Text('Step 4 Form'),
          subtitle: const Text('Register subtitle'),
          content: const Center(
            child: Text('Step 4 Page'),
          ),
          isActive: currentStep >= 3,
        ),
      ];

  Widget _successPage() {
    return Center(child: Column(
      children:  [
        const Text('Success!'),
        ElevatedButton(onPressed: (){
          setState(() {
            isCompleted = false;
          });
        }, child: const Text('RESET')),
      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return isCompleted == true ?_successPage() :Theme(
      data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.green)),
      child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;

            if (isLastStep) {
              print('Success');
              setState(() => isCompleted = true);
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepCancel: () =>
              currentStep == 0 ? null : setState(() => currentStep -= 1),
          onStepTapped: (step) => setState(() {
                currentStep = step;
              }),
          controlsBuilder: (context,
              {onStepContinue, onStepCancel}) {
            final isLastStep = currentStep == getSteps().length -1;
            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    child: Text(isLastStep? 'CONFIRM': 'NEXT'),
                    onPressed: onStepContinue,
                  )),
                  if(currentStep !=0)
                  Expanded(
                      child: ElevatedButton(
                    child: const Text('BACK'),
                    onPressed: onStepCancel,
                  )),
                  //Expanded(child: ElevatedButton(child: const Text('NEXT'),onPressed: (){},)),
                ],
              ),
            );
          }),
    );
  }
}
