import 'package:cached_network_image/cached_network_image.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/utils/utils.dart';
import 'package:market_news_app/modules/dashboard/presentation/cubit/dashboard_cubit.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.theme.scaffoldBackgroundColor,
        title: Row(
          children: [
            BlocBuilder<DashboardCubit, DashboardState>(
              buildWhen: (previous, current) {
                return current is GetUserInfoSuccessful || current is GetUserInfoError || current is DashboardLoading;
              },
              builder: (context, state) {
                switch (state) {
                  case GetUserInfoSuccessful(:final user):
                    return _Username(firstName: user.firstName);
                  case GetUserInfoError(:final message):
                    context.showToast(title: message);
                    return _Username();
                  case DashboardLoading():
                    return _Username(firstName: 'Hey, welcome...');
                  default:
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            switch (state) {
              case GetNewsSuccessful(:final news):
                return ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    final newsItem = news[index];
                    return ListTile(
                      leading: SizedBox(
                        width: 100,
                        height: 100,
                        child: CachedNetworkImage(
                          imageUrl: newsItem.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomAutoSizeText(
                                newsItem.source.toUpperCase(),
                                style: context.labelMedium,
                              ),
                              CustomAutoSizeText(
                                newsItem.datetime,
                                style: context.labelMedium,
                              ),
                            ],
                          ),
                          VerticalSpace(6),
                          CustomAutoSizeText(
                            newsItem.headline,
                            style: context.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              case GetNewsError(:final message):
                return Center(
                  child: CustomAutoSizeText(message),
                );
              case DashboardLoading():
                return Center(
                  child: const CircularProgressIndicator(),
                );
              default:
                return Center(
                  child: const CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}

class _Username extends StatelessWidget {
  const _Username({
    this.firstName = '',
  });

  final String firstName;

  @override
  Widget build(BuildContext context) {
    return CustomAutoSizeText(
      firstName.isEmpty ? 'Hey User,' : 'Hey ${firstName.toSentenceCase}',
      style: context.titleLarge?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w900,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
