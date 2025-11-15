function save-vars --wraps=vault\ kv\ put\ -mount=chezmoi\ laptop-01.tres.sims.family/fish_variables\ data=
    vault kv put -mount=chezmoi (hostname)/fish_variables data=(cat ~/.config/fish/fish_variables)
end
