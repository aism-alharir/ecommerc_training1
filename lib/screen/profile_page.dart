import 'package:ecommerc_training/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/bloc/profile/bloc/profile_bloc.dart';
import '../features/profile/domain/entities/user.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfileEvent(user)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              fontFamily: 'Calibri',
              fontSize: 20.sp,
            ),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            } else if (state is ProfileLoaded) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    _buildProfileHeader(state.user),
                    SizedBox(height: 24.h),
                    _buildProfileForm(state.user, context),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Profile not available'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildProfileHeader(User user) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.grey[200],
          backgroundImage:
              user.imageUrl != null ? Image.asset(user.imageUrl!).image : null,
          child: user.imageUrl == null
              ? Icon(Icons.person, size: 50.r, color: Colors.grey)
              : null,
        ),
        SizedBox(height: 16.h),
        Text(
          user.name,
          style: TextStyle(
            fontFamily: 'Calibri',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          user.email,
          style: TextStyle(
            fontFamily: 'Calibri',
            fontSize: 16.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileForm(User user, BuildContext context) {
    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);
    final phoneController = TextEditingController(text: user.phone ?? '');
    final addressController = TextEditingController(text: user.address ?? '');

    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
          ),
          style: const TextStyle(fontFamily: 'Calibri'),
        ),
        SizedBox(height: 16.h),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
          style: const TextStyle(fontFamily: 'Calibri'),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(
            labelText: 'Phone',
            prefixIcon: Icon(Icons.phone),
            border: OutlineInputBorder(),
          ),
          style: const TextStyle(fontFamily: 'Calibri'),
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 16.h),
        TextFormField(
          controller: addressController,
          decoration: const InputDecoration(
            labelText: 'Address',
            prefixIcon: Icon(Icons.location_on),
            border: OutlineInputBorder(),
          ),
          style: const TextStyle(fontFamily: 'Calibri'),
          maxLines: 2,
        ),
        SizedBox(height: 24.h),
        ElevatedButton(
          onPressed: () {
            final updatedUser = User(
              id: user.id,
              name: nameController.text,
              email: emailController.text,
              phone:
                  phoneController.text.isNotEmpty ? phoneController.text : null,
              address: addressController.text.isNotEmpty
                  ? addressController.text
                  : null,
              imageUrl: user.imageUrl,
            );
            context.read<ProfileBloc>().add(UpdateProfileEvent(updatedUser));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            minimumSize: Size(double.infinity, 50.h),
          ),
          child: Text(
            'Save Changes',
            style: TextStyle(
              fontFamily: 'Calibri',
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
