# Thanks to
# <https://morgan.cugerone.com/blog/workarounds-to-git-worktree-using-bare-repository-and-cannot-fetch-remote-branches/>

function git-clone-bare --argument-names git_url
    if test -z "$git_url"
        echo "usage: git-clone-bare <git-url>" >&2
        return 1
    end

    set repo_name (string replace -r '.*/([^/]+?)(\.git)?$' '$1' -- "$git_url")

    if test -z "$repo_name"
        echo "could not determine repository name from URL: $git_url" >&2
        return 1
    end

    if test -e "$repo_name"
        echo "path already exists: $repo_name" >&2
        return 1
    end

    mkdir "$repo_name"; or return 1
    cd "$repo_name"; or return 1

    git clone --bare "$git_url" .bare; or return 1
    echo "gitdir: ./.bare" > .git
    git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"; or return 1
    git fetch origin; or return 1
end
