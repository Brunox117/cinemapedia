import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  
  StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => HomeScreen(
            currentChild: navigationShell,
          ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/',
              builder: (context, state) {
                return const HomeView();
              },
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  name: MovieScreen.name,
                  builder: (context, state) {
                    final movieId = state.pathParameters['id'] ?? 'no-id';
                    return MovieScreen(
                      movieId: movieId,
                    );
                  },
                ),
                GoRoute(
                  
                  path: 'moviesCategory/:category',
                  builder: (context, state) {
                    final category =
                        state.pathParameters['category'] ?? 'no-category';
                    return MoviesView(
                      category: category,
                    );
                  },
                ),
              ]),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/tvShows',
            builder: (context, state) {
              return const TvShowsView();
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/favorites',
            builder: (context, state) {
              return const FavoritesView();
            },
          ),
        ]),
      ])
]);
