function opponentNoteHit()
	health = getProperty('health')
	if getProperty('health') > 0.1 then
		setProperty('health', health -0.014);
	end
end

function onUpdate(elapsed)
    health = getProperty('health')
	if boyfriendName == 'stonebf' then
		if getProperty('health') > 0.1 then
			setProperty('health', health -0.0125);
		end
	end
end