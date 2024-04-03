import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasi_uduk/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:nasi_uduk/screens/home/blocs/get_Warteg_bloc/get_warteg_bloc.dart';
import 'package:nasi_uduk/screens/home/views/details_Screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset('assets/8.jpg', scale: 8),
            const SizedBox(width: 8),
            const Text(
              'WARTEG',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: const Icon(CupertinoIcons.arrow_right_to_line)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetWartegBloc, GetWartegState>(
          builder: (context, state) {
            if(state is GetWartegSuccess) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 9 / 16),
                itemCount: state.wartegs.length,
                itemBuilder: (context, int i) {
                  return Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => DetailsScreen(
                              state.wartegs[i]
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(state.wartegs[i].picture),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: state.wartegs[i].isveg
                                      ? Colors.green
                                      : Colors.red,
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    child: Text(
                                      state.wartegs[i].isveg
                                        ? "VEG"
                                        : "NON-VEG",
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    child: Text(
                                      state.wartegs[i].spicy == 1
                                        ? "🌶️ BLAND"
                                        : state.wartegs[i].spicy == 2
                                          ? "🌶️ BALANCE"
                                          : "🌶️ SPICY",
                                      style: TextStyle(
                                        color: state.wartegs[i].spicy == 1
                                        ? Colors.green
                                        : state.wartegs[i].spicy == 2
                                          ? Colors.orange
                                          : Colors.redAccent, 
                                        fontWeight: FontWeight.w800, 
                                        fontSize: 10
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              state.wartegs[i].name,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              state.wartegs[i].description,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\Rp${state.wartegs[i].price - (state.wartegs[i].price - (state.wartegs[i].discount) / 1)}",
                                          style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "\Rp${state.wartegs[i].price}",
                                          style: TextStyle(fontSize: 12, color: Colors.grey.shade500, fontWeight: FontWeight.w700, decoration: TextDecoration.lineThrough),
                                        ),
                                          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart_fill))
                                      ],
                                      
                                    ),
                                    
                                  ),
                                ),
                              
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  );
                }
              );
            } else if(state is GetWartegLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text(
                  "Error"
                ),
              );
            }
          },
        ),
      ),
    );
  }
}