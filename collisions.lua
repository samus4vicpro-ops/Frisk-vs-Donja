local collision = {}

function collision.abba(ax, ay, aw, ah, bx, by, bw, bh)
    return ax < bx + bw and bx < ax + aw and ay < by + bh and by < ay + ah
end

function collision.hit(ax, ay, aw, ah, scaleA, factorA, bx, by, bw, bh, scaleB, factorB)
    factorA = factorA or 1
    factorB = factorB or 1

    -- A
    local rwA = aw * scaleA
    local rhA = ah * scaleA
    local wA  = rwA * factorA
    local hA  = rhA * factorA
    local xA  = ax + (rwA - wA) * 0.5
    local yA  = ay + (rhA - hA) * 0.5

    -- B
    local rwB = bw * scaleB
    local rhB = bh * scaleB
    local wB  = rwB * factorB
    local hB  = rhB * factorB
    local xB  = bx + (rwB - wB) * 0.5
    local yB  = by + (rhB - hB) * 0.5

    return xA < xB + wB and xB < xA + wA and yA < yB + hB and yB < yA + hA
end

function collision.drawHitbox(x, y, w, h, scale, factor)
    scale  = scale  or 1
    factor = factor or 1   -- 1 = 100%, 0.8 = 80%, etc.

    -- tamaño real escalado
    local rw = w * scale
    local rh = h * scale

    -- tamaño hitbox según factor
    local hw = rw * factor
    local hh = rh * factor

    -- centrar hitbox
    local hx = x + (rw - hw) * 0.5
    local hy = y + (rh - hh) * 0.5

    -- dibujar hitbox
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("line", hx, hy, hw, hh)
    love.graphics.setColor(1, 1, 1)
end

return collision