import 'package:cached_network_image/cached_network_image.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/utils/utils.dart';
import 'package:market_news_app/modules/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:shimmer/shimmer.dart';

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
        surfaceTintColor: Colors.transparent,
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
      body: BlocBuilder<DashboardCubit, DashboardState>(
        buildWhen: (previous, current) {
          return current is GetNewsLoading || current is GetNewsSuccessful || current is GetNewsError;
        },
        builder: (context, state) {
          switch (state) {
            case GetNewsLoading():
              return ListView.builder(
                itemCount: 10, // Number of shimmer items
                itemBuilder: (context, index) {
                  return _ShimmerNewsItem();
                },
              );
            case GetNewsSuccessful(:final news):
              return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  final newsItem = news[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100.w,
                          height: 100.h,
                          child: CachedNetworkImage(
                            imageUrl: newsItem.image,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => ColoredBox(
                              color: context.secondaryColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomAutoSizeText(
                                  newsItem.source.toUpperCase(),
                                  style: context.labelMedium?.copyWith(
                                    color: context.theme.colorScheme.secondary,
                                  ),
                                ),
                                HorizontalSpace(20),
                                CustomAutoSizeText(
                                  newsItem.datetime,
                                  style: context.labelMedium?.copyWith(
                                    color: context.theme.colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            VerticalSpace(6),
                            SizedBox(
                              width: 220.w,
                              child: CustomAutoSizeText(
                                newsItem.headline,
                                presetFontSizes: [16.h],
                                style: context.bodyLarge?.copyWith(
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
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
            default:
              return SizedBox();
          }
        },
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

class _ShimmerNewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 80.h,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200.w,
                  height: 16.h,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Container(
                  width: 160.w,
                  height: 14.h,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Container(
                  width: 100.w,
                  height: 14.h,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
